import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../data/models/food_entry.dart';
import '../../data/providers/nutrition_providers.dart';
import '../../data/services/database_service.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodEntriesAsync = ref.watch(foodEntriesProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food History'),
      ),
      body: foodEntriesAsync.when(
        data: (entries) {
          if (entries.isEmpty) {
            return _buildEmptyState();
          }
          return _buildFoodList(entries, ref);
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
  
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.history,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            'No food entries yet',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Start by adding your first meal',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
  
  Widget _buildFoodList(List<FoodEntry> entries, WidgetRef ref) {
    // Group entries by date
    final groupedEntries = <String, List<FoodEntry>>{};
    final dateFormat = DateFormat('EEEE, MMM d');
    
    for (final entry in entries) {
      final dateKey = dateFormat.format(entry.timestamp);
      groupedEntries.putIfAbsent(dateKey, () => []).add(entry);
    }
    
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: groupedEntries.length,
      itemBuilder: (context, index) {
        final dateKey = groupedEntries.keys.elementAt(index);
        final dayEntries = groupedEntries[dateKey]!;
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index > 0) const SizedBox(height: 24),
            _buildDateHeader(dateKey, dayEntries),
            const SizedBox(height: 12),
            ...dayEntries.map((entry) => _buildFoodEntryCard(entry, ref)),
          ],
        );
      },
    );
  }
  
  Widget _buildDateHeader(String date, List<FoodEntry> entries) {
    final totalCalories = entries.fold<double>(
      0,
      (sum, entry) => sum + entry.calories,
    );
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            '${totalCalories.toStringAsFixed(0)} kcal',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildFoodEntryCard(FoodEntry entry, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Dismissible(
        key: Key(entry.id.toString()),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        confirmDismiss: (direction) async {
          return await showDialog<bool>(
            context: ref.context,
            builder: (context) => AlertDialog(
              title: const Text('Delete Entry'),
              content: Text('Remove "${entry.name}" from your history?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Delete'),
                ),
              ],
            ),
          );
        },
        onDismissed: (direction) async {
          final dbService = ref.read(databaseServiceProvider);
          await dbService.deleteFoodEntry(entry.id);
          
          if (ref.context.mounted) {
            ScaffoldMessenger.of(ref.context).showSnackBar(
              SnackBar(content: Text('${entry.name} deleted')),
            );
          }
        },
        child: ListTile(
          leading: _buildFoodImage(entry.imageBase64),
          title: Text(
            entry.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${entry.calories.toStringAsFixed(0)} kcal'),
              Text(
                'P: ${entry.protein.toStringAsFixed(1)}g • '
                'C: ${entry.carbs.toStringAsFixed(1)}g • '
                'F: ${entry.fat.toStringAsFixed(1)}g',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          trailing: Text(
            DateFormat('HH:mm').format(entry.timestamp),
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildFoodImage(String? imageBase64) {
    if (imageBase64 == null || imageBase64.isEmpty) {
      return Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.restaurant,
          color: Colors.grey,
        ),
      );
    }
    
    try {
      // For now, show a placeholder. In real implementation,
      // we'd decode the base64 string to show the actual image
      return Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          Icons.fastfood,
          color: Colors.green[600],
        ),
      );
    } catch (e) {
      return Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.error,
          color: Colors.grey,
        ),
      );
    }
  }
}