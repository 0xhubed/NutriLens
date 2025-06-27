import 'package:isar/isar.dart';

import '../models/measurement_guide.dart';
import '../models/measurement_unit.dart';

class MeasurementGuideService {
  final Isar isar;
  
  MeasurementGuideService(this.isar);

  /// Initialize guides database with predefined guides
  Future<void> initializeGuides() async {
    final existingCount = await isar.measurementGuides.count();
    if (existingCount > 0) return; // Already initialized
    
    final predefinedGuides = MeasurementGuideDatabase.getPredefinedGuides();
    
    await isar.writeTxn(() async {
      await isar.measurementGuides.putAll(predefinedGuides);
    });
  }

  /// Get all guides
  Future<List<MeasurementGuide>> getAllGuides() async {
    await initializeGuides();
    return await isar.measurementGuides
        .where()
        .sortByTitle()
        .findAll();
  }

  /// Get guide for specific unit
  Future<MeasurementGuide?> getGuideForUnit(String unitId) async {
    await initializeGuides();
    
    final guide = await isar.measurementGuides
        .filter()
        .unitIdEqualTo(unitId)
        .findFirst();
    
    if (guide != null) {
      await _markAsViewed(guide);
    }
    
    return guide;
  }

  /// Get guides by category
  Future<List<MeasurementGuide>> getGuidesByCategory(MeasurementCategory category) async {
    await initializeGuides();
    return await isar.measurementGuides
        .filter()
        .categoryEqualTo(category)
        .sortByTitle()
        .findAll();
  }

  /// Search guides
  Future<List<MeasurementGuide>> searchGuides(String query) async {
    if (query.trim().isEmpty) return await getAllGuides();
    
    await initializeGuides();
    final lowerQuery = query.toLowerCase();
    
    return await isar.measurementGuides
        .filter()
        .titleContains(query, caseSensitive: false)
        .or()
        .descriptionContains(query, caseSensitive: false)
        .or()
        .visualComparisonContains(query, caseSensitive: false)
        .or()
        .bestForElementContains(lowerQuery)
        .or()
        .examplesElementContains(lowerQuery)
        .sortByViewCountDesc()
        .findAll();
  }

  /// Get favorite guides
  Future<List<MeasurementGuide>> getFavoriteGuides() async {
    await initializeGuides();
    return await isar.measurementGuides
        .filter()
        .isUserFavoriteEqualTo(true)
        .sortByTitle()
        .findAll();
  }

  /// Get popular guides (most viewed)
  Future<List<MeasurementGuide>> getPopularGuides({int limit = 10}) async {
    await initializeGuides();
    return await isar.measurementGuides
        .where()
        .sortByViewCountDesc()
        .limit(limit)
        .findAll();
  }

  /// Get recently viewed guides
  Future<List<MeasurementGuide>> getRecentlyViewedGuides({int limit = 10}) async {
    await initializeGuides();
    return await isar.measurementGuides
        .filter()
        .lastViewedIsNotNull()
        .sortByLastViewedDesc()
        .limit(limit)
        .findAll();
  }

  /// Get quick reference guides (most essential ones)
  Future<List<MeasurementGuide>> getQuickReferenceGuides() async {
    await initializeGuides();
    
    // Return most commonly used measurement units
    final essentialUnits = ['cup', 'tbsp', 'tsp', 'oz', 'piece_medium', 'handful'];
    
    final guides = <MeasurementGuide>[];
    for (final unitId in essentialUnits) {
      final guide = await isar.measurementGuides
          .filter()
          .unitIdEqualTo(unitId)
          .findFirst();
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
    return await isar.measurementGuides
        .filter()
        .bestForElementContains(lowerFoodName)
        .or()
        .examplesElementContains(lowerFoodName)
        .sortByViewCountDesc()
        .findAll();
  }

  /// Get hand measurement guides
  Future<List<MeasurementGuide>> getHandMeasurementGuides() async {
    await initializeGuides();
    
    return await isar.measurementGuides
        .filter()
        .handComparisonsIsNotEmpty()
        .sortByTitle()
        .findAll();
  }

  /// Get cooking measurement guides
  Future<List<MeasurementGuide>> getCookingMeasurementGuides() async {
    await initializeGuides();
    
    return await isar.measurementGuides
        .filter()
        .categoryEqualTo(MeasurementCategory.liquid)
        .or()
        .categoryEqualTo(MeasurementCategory.powder)
        .sortByTitle()
        .findAll();
  }

  /// Get weight measurement guides
  Future<List<MeasurementGuide>> getWeightMeasurementGuides() async {
    await initializeGuides();
    
    return await isar.measurementGuides
        .filter()
        .categoryEqualTo(MeasurementCategory.powder)
        .sortByTitle()
        .findAll();
  }

  /// Toggle favorite status
  Future<void> toggleFavorite(int guideId) async {
    await isar.writeTxn(() async {
      final guide = await isar.measurementGuides.get(guideId);
      if (guide != null) {
        guide.isUserFavorite = !guide.isUserFavorite;
        await isar.measurementGuides.put(guide);
      }
    });
  }

  /// Get guide statistics
  Future<GuideStatistics> getGuideStatistics() async {
    await initializeGuides();
    
    final totalGuides = await isar.measurementGuides.count();
    final favoriteGuides = await isar.measurementGuides
        .filter()
        .isUserFavoriteEqualTo(true)
        .count();
    
    final viewedGuides = await isar.measurementGuides
        .filter()
        .viewCountGreaterThan(0)
        .count();
    
    final totalViews = await _getTotalViews();
    
    final categoryCounts = <MeasurementCategory, int>{};
    for (final category in MeasurementCategory.values) {
      final count = await isar.measurementGuides
          .filter()
          .categoryEqualTo(category)
          .count();
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
    await isar.writeTxn(() async {
      await isar.measurementGuides.put(guide);
    });
  }

  /// Update guide
  Future<void> updateGuide(MeasurementGuide guide) async {
    await isar.writeTxn(() async {
      await isar.measurementGuides.put(guide);
    });
  }

  /// Delete guide
  Future<void> deleteGuide(int guideId) async {
    await isar.writeTxn(() async {
      await isar.measurementGuides.delete(guideId);
    });
  }

  /// Private helper methods
  
  Future<void> _markAsViewed(MeasurementGuide guide) async {
    guide.markAsViewed();
    await isar.writeTxn(() async {
      await isar.measurementGuides.put(guide);
    });
  }

  Future<int> _getTotalViews() async {
    final guides = await isar.measurementGuides.where().findAll();
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