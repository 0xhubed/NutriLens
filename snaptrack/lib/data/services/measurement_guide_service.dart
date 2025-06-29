import 'package:hive/hive.dart';

import '../models/measurement_guide.dart';
import '../models/measurement_unit.dart';

class MeasurementGuideService {
  Box<MeasurementGuide> get _guideBox => Hive.box<MeasurementGuide>('measurementGuides');
  
  MeasurementGuideService();

  /// Initialize guides database with predefined guides
  Future<void> initializeGuides() async {
    if (_guideBox.isNotEmpty) return; // Already initialized
    
    final predefinedGuides = MeasurementGuideDatabase.getPredefinedGuides();
    
    for (int i = 0; i < predefinedGuides.length; i++) {
      final guide = predefinedGuides[i];
      guide.id ??= (i + 1).toString(); // Assign sequential IDs
      await _guideBox.put(guide.id, guide);
    }
  }

  /// Get all guides
  Future<List<MeasurementGuide>> getAllGuides() async {
    await initializeGuides();
    final guides = _guideBox.values.toList()
      ..sort((a, b) => a.title.compareTo(b.title));
    return guides;
  }

  /// Get guide for specific unit
  Future<MeasurementGuide?> getGuideForUnit(String unitId) async {
    await initializeGuides();
    
    final guide = _guideBox.values
        .where((guide) => guide.unitId == unitId)
        .firstOrNull;
    
    if (guide != null) {
      await _markAsViewed(guide);
    }
    
    return guide;
  }

  /// Get guides by category
  Future<List<MeasurementGuide>> getGuidesByCategory(MeasurementCategory category) async {
    await initializeGuides();
    final guides = _guideBox.values
        .where((guide) => guide.category == category)
        .toList()
      ..sort((a, b) => a.title.compareTo(b.title));
    return guides;
  }

  /// Search guides
  Future<List<MeasurementGuide>> searchGuides(String query) async {
    if (query.trim().isEmpty) return await getAllGuides();
    
    await initializeGuides();
    final lowerQuery = query.toLowerCase();
    
    final guides = _guideBox.values
        .where((guide) =>
            guide.title.toLowerCase().contains(lowerQuery) ||
            guide.description.toLowerCase().contains(lowerQuery) ||
            guide.visualComparison.toLowerCase().contains(lowerQuery) ||
            guide.bestFor.any((item) => item.toLowerCase().contains(lowerQuery)) ||
            guide.examples.any((item) => item.toLowerCase().contains(lowerQuery)))
        .toList()
      ..sort((a, b) => b.viewCount.compareTo(a.viewCount));
    
    return guides;
  }

  /// Get favorite guides
  Future<List<MeasurementGuide>> getFavoriteGuides() async {
    await initializeGuides();
    final guides = _guideBox.values
        .where((guide) => guide.isUserFavorite)
        .toList()
      ..sort((a, b) => a.title.compareTo(b.title));
    return guides;
  }

  /// Get popular guides (most viewed)
  Future<List<MeasurementGuide>> getPopularGuides({int limit = 10}) async {
    await initializeGuides();
    final guides = _guideBox.values.toList()
      ..sort((a, b) => b.viewCount.compareTo(a.viewCount));
    return guides.take(limit).toList();
  }

  /// Get recently viewed guides
  Future<List<MeasurementGuide>> getRecentlyViewedGuides({int limit = 10}) async {
    await initializeGuides();
    final guides = _guideBox.values
        .where((guide) => guide.lastViewed != null)
        .toList()
      ..sort((a, b) => b.lastViewed!.compareTo(a.lastViewed!));
    return guides.take(limit).toList();
  }

  /// Get quick reference guides (most essential ones)
  Future<List<MeasurementGuide>> getQuickReferenceGuides() async {
    await initializeGuides();
    
    // Return most commonly used measurement units
    final essentialUnits = ['cup', 'tbsp', 'tsp', 'oz', 'piece_medium', 'handful'];
    
    final guides = <MeasurementGuide>[];
    for (final unitId in essentialUnits) {
      final guide = _guideBox.values
          .where((guide) => guide.unitId == unitId)
          .firstOrNull;
      if (guide != null) {
        guides.add(guide);
      }
    }
    
    return guides;
  }

  /// Get guides suitable for specific food
  Future<List<MeasurementGuide>> getGuidesForFood(String foodName) async {
    await initializeGuides();
    
    final lowerFoodName = foodName.toLowerCase();
    
    // Find guides where the food name matches the bestFor categories
    final guides = _guideBox.values
        .where((guide) =>
            guide.bestFor.any((item) => item.toLowerCase().contains(lowerFoodName)) ||
            guide.examples.any((item) => item.toLowerCase().contains(lowerFoodName)))
        .toList()
      ..sort((a, b) => b.viewCount.compareTo(a.viewCount));
    
    return guides;
  }

  /// Get hand measurement guides
  Future<List<MeasurementGuide>> getHandMeasurementGuides() async {
    await initializeGuides();
    
    final guides = _guideBox.values
        .where((guide) => guide.handComparisons.isNotEmpty)
        .toList()
      ..sort((a, b) => a.title.compareTo(b.title));
    
    return guides;
  }

  /// Get cooking measurement guides
  Future<List<MeasurementGuide>> getCookingMeasurementGuides() async {
    await initializeGuides();
    
    final guides = _guideBox.values
        .where((guide) => 
            guide.category == MeasurementCategory.liquid ||
            guide.category == MeasurementCategory.powder)
        .toList()
      ..sort((a, b) => a.title.compareTo(b.title));
    
    return guides;
  }

  /// Get weight measurement guides
  Future<List<MeasurementGuide>> getWeightMeasurementGuides() async {
    await initializeGuides();
    
    final guides = _guideBox.values
        .where((guide) => guide.category == MeasurementCategory.powder)
        .toList()
      ..sort((a, b) => a.title.compareTo(b.title));
    
    return guides;
  }

  /// Toggle favorite status
  Future<void> toggleFavorite(int guideId) async {
    final guide = _guideBox.get(guideId);
    if (guide != null) {
      guide.isUserFavorite = !guide.isUserFavorite;
      await _guideBox.put(guideId, guide);
    }
  }

  /// Get guide statistics
  Future<GuideStatistics> getGuideStatistics() async {
    await initializeGuides();
    
    final totalGuides = _guideBox.length;
    final favoriteGuides = _guideBox.values
        .where((guide) => guide.isUserFavorite)
        .length;
    
    final viewedGuides = _guideBox.values
        .where((guide) => guide.viewCount > 0)
        .length;
    
    final totalViews = await _getTotalViews();
    
    final categoryCounts = <MeasurementCategory, int>{};
    for (final category in MeasurementCategory.values) {
      final count = _guideBox.values
          .where((guide) => guide.category == category)
          .length;
      categoryCounts[category] = count;
    }
    
    return GuideStatistics(
      totalGuides: totalGuides,
      favoriteGuides: favoriteGuides,
      viewedGuides: viewedGuides,
      totalViews: totalViews,
      categoryCounts: categoryCounts,
    );
  }

  /// Create custom guide
  Future<void> createCustomGuide(MeasurementGuide guide) async {
    guide.id ??= DateTime.now().millisecondsSinceEpoch.toString();
    await _guideBox.put(guide.id, guide);
  }

  /// Update guide
  Future<void> updateGuide(MeasurementGuide guide) async {
    if (guide.id == null) return;
    await _guideBox.put(guide.id, guide);
  }

  /// Delete guide
  Future<void> deleteGuide(int guideId) async {
    await _guideBox.delete(guideId);
  }

  /// Private helper methods
  
  Future<void> _markAsViewed(MeasurementGuide guide) async {
    guide.markAsViewed();
    await _guideBox.put(guide.id, guide);
  }

  Future<int> _getTotalViews() async {
    final guides = _guideBox.values.toList();
    return guides.fold<int>(0, (int sum, guide) => sum + guide.viewCount);
  }
}

class GuideStatistics {
  final int totalGuides;
  final int favoriteGuides;
  final int viewedGuides;
  final int totalViews;
  final Map<MeasurementCategory, int> categoryCounts;

  GuideStatistics({
    required this.totalGuides,
    required this.favoriteGuides,
    required this.viewedGuides,
    required this.totalViews,
    required this.categoryCounts,
  });

  double get viewedPercentage => totalGuides > 0 ? (viewedGuides / totalGuides) * 100 : 0;
  double get favoritePercentage => totalGuides > 0 ? (favoriteGuides / totalGuides) * 100 : 0;
  double get averageViewsPerGuide => totalGuides > 0 ? totalViews / totalGuides : 0;
  
  MeasurementCategory get mostPopularCategory {
    return categoryCounts.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;
  }
}