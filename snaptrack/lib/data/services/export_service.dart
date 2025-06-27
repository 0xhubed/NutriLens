import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../models/food_entry.dart';
import 'database_service.dart';

class DateRange {
  final DateTime start;
  final DateTime end;

  DateRange({required this.start, required this.end});
}

class ExportOptions {
  final bool includeImages;
  final List<MealType>? mealTypes;
  final bool includeNutritionBreakdown;

  ExportOptions({
    this.includeImages = false,
    this.mealTypes,
    this.includeNutritionBreakdown = true,
  });
}

enum ShareMethod { 
  email, 
  saveToFiles, 
  share 
}

class ExportService {
  final DatabaseService _dbService;

  ExportService(this._dbService);

  // Export to CSV format
  Future<File> exportToCSV(DateRange range, {ExportOptions? options}) async {
    final entries = await _dbService.getFoodEntriesInRange(range.start, range.end);
    final opt = options ?? ExportOptions();
    
    final buffer = StringBuffer();
    
    // CSV Header
    buffer.writeln('Date,Time,Food,Calories,Protein,Carbs,Fat,Meal Type,AI Provider,Cuisine,Dietary Tags');
    
    // Filter by meal types if specified
    final filteredEntries = opt.mealTypes != null
        ? entries.where((entry) => opt.mealTypes!.contains(entry.mealType)).toList()
        : entries;
    
    // CSV Data
    for (final entry in filteredEntries) {
      final dateStr = DateFormat('yyyy-MM-dd').format(entry.timestamp);
      final timeStr = DateFormat('HH:mm').format(entry.timestamp);
      final name = _escapeCsvValue(entry.name);
      final mealType = entry.mealType.name;
      final aiProvider = entry.aiProvider ?? 'Manual';
      final cuisine = entry.cuisine.name;
      final dietaryTags = entry.dietaryTags.map((tag) => tag.name).join(';');
      
      buffer.writeln('$dateStr,$timeStr,$name,${entry.calories},${entry.protein},${entry.carbs},${entry.fat},$mealType,$aiProvider,$cuisine,$dietaryTags');
    }
    
    // Save to file
    final directory = await getApplicationDocumentsDirectory();
    final filename = 'snaptrack_export_${DateFormat('yyyyMMdd_HHmmss').format(DateTime.now())}.csv';
    final file = File('${directory.path}/$filename');
    
    await file.writeAsString(buffer.toString());
    return file;
  }

  // Export to JSON format
  Future<File> exportToJSON(DateRange range, {ExportOptions? options}) async {
    final entries = await _dbService.getFoodEntriesInRange(range.start, range.end);
    final opt = options ?? ExportOptions();
    
    // Filter by meal types if specified
    final filteredEntries = opt.mealTypes != null
        ? entries.where((entry) => opt.mealTypes!.contains(entry.mealType)).toList()
        : entries;
    
    final exportData = {
      'export_date': DateTime.now().toIso8601String(),
      'date_range': {
        'start': range.start.toIso8601String(),
        'end': range.end.toIso8601String(),
      },
      'total_entries': filteredEntries.length,
      'summary': {
        'total_calories': filteredEntries.fold<double>(0, (sum, entry) => sum + entry.calories),
        'total_protein': filteredEntries.fold<double>(0, (sum, entry) => sum + entry.protein),
        'total_carbs': filteredEntries.fold<double>(0, (sum, entry) => sum + entry.carbs),
        'total_fat': filteredEntries.fold<double>(0, (sum, entry) => sum + entry.fat),
      },
      'entries': filteredEntries.map((entry) => {
        'timestamp': entry.timestamp.toIso8601String(),
        'food': entry.name,
        'nutrition': {
          'calories': entry.calories,
          'macros': {
            'protein': entry.protein,
            'carbs': entry.carbs,
            'fat': entry.fat,
          }
        },
        'meal_type': entry.mealType.name,
        'ai_provider': entry.aiProvider ?? 'Manual',
        'food_groups': entry.foodGroups.map((group) => group.name).toList(),
        'cuisine': entry.cuisine.name,
        'dietary_tags': entry.dietaryTags.map((tag) => tag.name).toList(),
        if (entry.portionSize != null) 'portion_size': entry.portionSize,
        if (entry.cookingMethod != null) 'cooking_method': entry.cookingMethod,
        if (opt.includeNutritionBreakdown && entry.detectedItems.isNotEmpty)
          'detected_items': entry.detectedItems.map((item) => {
            'name': item.name,
            'calories': item.calories,
            'protein': item.protein,
            'carbs': item.carbs,
            'fat': item.fat,
            'portion': item.portion,
          }).toList(),
        if (opt.includeImages && entry.imageBase64 != null)
          'has_image': true,
      }).toList(),
    };
    
    // Save to file
    final directory = await getApplicationDocumentsDirectory();
    final filename = 'snaptrack_export_${DateFormat('yyyyMMdd_HHmmss').format(DateTime.now())}.json';
    final file = File('${directory.path}/$filename');
    
    const encoder = JsonEncoder.withIndent('  ');
    await file.writeAsString(encoder.convert(exportData));
    return file;
  }

  // Generate summary report (simplified version)
  Future<File> generateSummaryReport(DateRange range) async {
    final entries = await _dbService.getFoodEntriesInRange(range.start, range.end);
    
    if (entries.isEmpty) {
      throw Exception('No data available for the selected date range');
    }
    
    // Calculate summary statistics
    final totalCalories = entries.fold<double>(0, (sum, entry) => sum + entry.calories);
    final totalProtein = entries.fold<double>(0, (sum, entry) => sum + entry.protein);
    final totalCarbs = entries.fold<double>(0, (sum, entry) => sum + entry.carbs);
    final totalFat = entries.fold<double>(0, (sum, entry) => sum + entry.fat);
    
    final avgCalories = totalCalories / entries.length;
    final avgProtein = totalProtein / entries.length;
    final avgCarbs = totalCarbs / entries.length;
    final avgFat = totalFat / entries.length;
    
    // Group by day
    final entriesByDay = <DateTime, List<FoodEntry>>{};
    for (final entry in entries) {
      final day = DateTime(entry.timestamp.year, entry.timestamp.month, entry.timestamp.day);
      entriesByDay.putIfAbsent(day, () => []).add(entry);
    }
    
    // Most frequent foods
    final foodCounts = <String, int>{};
    for (final entry in entries) {
      foodCounts[entry.name] = (foodCounts[entry.name] ?? 0) + 1;
    }
    final topFoods = foodCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value))
      ..take(10);
    
    // Generate text report
    final buffer = StringBuffer();
    
    buffer.writeln('NutriLens Nutrition Summary Report');
    buffer.writeln('Generated: ${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now())}');
    buffer.writeln('Period: ${DateFormat('yyyy-MM-dd').format(range.start)} to ${DateFormat('yyyy-MM-dd').format(range.end)}');
    buffer.writeln('=' * 50);
    buffer.writeln();
    
    buffer.writeln('OVERVIEW:');
    buffer.writeln('Total Entries: ${entries.length}');
    buffer.writeln('Days with Data: ${entriesByDay.length}');
    buffer.writeln('Average Entries per Day: ${(entries.length / entriesByDay.length).toStringAsFixed(1)}');
    buffer.writeln();
    
    buffer.writeln('NUTRITION TOTALS:');
    buffer.writeln('Total Calories: ${totalCalories.toStringAsFixed(0)} kcal');
    buffer.writeln('Total Protein: ${totalProtein.toStringAsFixed(1)} g');
    buffer.writeln('Total Carbs: ${totalCarbs.toStringAsFixed(1)} g');
    buffer.writeln('Total Fat: ${totalFat.toStringAsFixed(1)} g');
    buffer.writeln();
    
    buffer.writeln('DAILY AVERAGES:');
    buffer.writeln('Avg Calories: ${avgCalories.toStringAsFixed(0)} kcal');
    buffer.writeln('Avg Protein: ${avgProtein.toStringAsFixed(1)} g');
    buffer.writeln('Avg Carbs: ${avgCarbs.toStringAsFixed(1)} g');
    buffer.writeln('Avg Fat: ${avgFat.toStringAsFixed(1)} g');
    buffer.writeln();
    
    buffer.writeln('TOP FOODS:');
    for (int i = 0; i < topFoods.length && i < 10; i++) {
      final food = topFoods[i];
      buffer.writeln('${i + 1}. ${food.key} (${food.value}x)');
    }
    buffer.writeln();
    
    buffer.writeln('DAILY BREAKDOWN:');
    final sortedDays = entriesByDay.keys.toList()..sort();
    for (final day in sortedDays) {
      final dayEntries = entriesByDay[day]!;
      final dayCalories = dayEntries.fold<double>(0, (sum, entry) => sum + entry.calories);
      buffer.writeln('${DateFormat('yyyy-MM-dd').format(day)}: ${dayCalories.toStringAsFixed(0)} kcal (${dayEntries.length} meals)');
    }
    
    // Save to file
    final directory = await getApplicationDocumentsDirectory();
    final filename = 'snaptrack_summary_${DateFormat('yyyyMMdd_HHmmss').format(DateTime.now())}.txt';
    final file = File('${directory.path}/$filename');
    
    await file.writeAsString(buffer.toString());
    return file;
  }

  // Share export file
  Future<void> shareExport(File exportFile, ShareMethod method) async {
    switch (method) {
      case ShareMethod.share:
        await Share.shareXFiles(
          [XFile(exportFile.path)],
          text: 'NutriLens nutrition data export',
        );
        break;
      case ShareMethod.saveToFiles:
        // Files are already saved to documents directory
        break;
      case ShareMethod.email:
        await Share.shareXFiles(
          [XFile(exportFile.path)],
          text: 'Please find attached my nutrition data from NutriLens.',
          subject: 'NutriLens Nutrition Data Export',
        );
        break;
    }
  }

  // Helper method to escape CSV values
  String _escapeCsvValue(String value) {
    if (value.contains(',') || value.contains('"') || value.contains('\n')) {
      return '"${value.replaceAll('"', '""')}"';
    }
    return value;
  }
}

// Provider for export service
final exportServiceProvider = Provider<ExportService>((ref) {
  final dbService = ref.watch(databaseServiceProvider);
  return ExportService(dbService);
});