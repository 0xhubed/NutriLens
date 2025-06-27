import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/user_metrics.dart';
import 'database_service.dart';

final metricsServiceProvider = Provider<MetricsService>((ref) {
  final databaseService = ref.watch(databaseServiceProvider);
  return MetricsService(databaseService.database);
});

class MetricsService {
  final Isar isar;
  
  MetricsService(this.isar);

  // User Metrics CRUD operations
  Future<void> saveMetrics(UserMetrics metrics) async {
    await isar.writeTxn(() async {
      await isar.userMetrics.put(metrics);
    });
  }

  Future<void> updateMetrics(UserMetrics metrics) async {
    await isar.writeTxn(() async {
      await isar.userMetrics.put(metrics);
    });
  }

  Future<UserMetrics?> getMetricsForDate(DateTime date) async {
    final dateOnly = DateTime(date.year, date.month, date.day);
    return await isar.userMetrics
        .where()
        .dateEqualTo(dateOnly)
        .findFirst();
  }

  Future<UserMetrics?> getLatestMetrics() async {
    return await isar.userMetrics
        .where()
        .sortByDateDesc()
        .findFirst();
  }

  Future<List<UserMetrics>> getMetricsInRange(DateTime startDate, DateTime endDate) async {
    return await isar.userMetrics
        .filter()
        .dateBetween(startDate, endDate, includeUpper: false)
        .sortByDate()
        .findAll();
  }

  Stream<UserMetrics?> watchTodayMetrics() {
    final today = DateTime.now();
    final dateOnly = DateTime(today.year, today.month, today.day);
    
    return isar.userMetrics
        .where()
        .dateEqualTo(dateOnly)
        .watch(fireImmediately: true)
        .map((list) => list.isEmpty ? null : list.first);
  }

  Stream<List<UserMetrics>> watchAllMetrics() {
    return isar.userMetrics
        .where()
        .sortByDateDesc()
        .watch(fireImmediately: true);
  }

  // Quick logging methods
  Future<void> logWeight(double weight, {DateTime? date}) async {
    final targetDate = date ?? DateTime.now();
    final dateOnly = DateTime(targetDate.year, targetDate.month, targetDate.day);
    
    var metrics = await getMetricsForDate(dateOnly);
    
    if (metrics == null) {
      metrics = UserMetrics()
        ..date = dateOnly
        ..weight = weight;
    } else {
      metrics.weight = weight;
    }
    
    await saveMetrics(metrics);
  }

  Future<void> logWater(double liters, {DateTime? date}) async {
    final targetDate = date ?? DateTime.now();
    final dateOnly = DateTime(targetDate.year, targetDate.month, targetDate.day);
    
    var metrics = await getMetricsForDate(dateOnly);
    
    if (metrics == null) {
      metrics = UserMetrics()
        ..date = dateOnly
        ..waterLiters = liters;
    } else {
      metrics.waterLiters = liters;
    }
    
    await saveMetrics(metrics);
  }

  Future<void> logSleep(double hours, {DateTime? date}) async {
    final targetDate = date ?? DateTime.now();
    final dateOnly = DateTime(targetDate.year, targetDate.month, targetDate.day);
    
    var metrics = await getMetricsForDate(dateOnly);
    
    if (metrics == null) {
      metrics = UserMetrics()
        ..date = dateOnly
        ..sleepHours = hours;
    } else {
      metrics.sleepHours = hours;
    }
    
    await saveMetrics(metrics);
  }

  Future<void> addWater(double liters, {DateTime? date}) async {
    final targetDate = date ?? DateTime.now();
    final dateOnly = DateTime(targetDate.year, targetDate.month, targetDate.day);
    
    var metrics = await getMetricsForDate(dateOnly);
    
    if (metrics == null) {
      metrics = UserMetrics()
        ..date = dateOnly
        ..waterLiters = liters
        ..dailyWaterGoal = 2.5; // Default 2.5L goal
    } else {
      metrics.waterLiters = (metrics.waterLiters ?? 0) + liters;
    }
    
    await saveMetrics(metrics);
  }

  // Analytics methods
  Future<double?> getAverageWeight({int days = 7}) async {
    final endDate = DateTime.now();
    final startDate = endDate.subtract(Duration(days: days));
    final metrics = await getMetricsInRange(startDate, endDate);
    
    final weights = metrics
        .where((m) => m.weight != null)
        .map((m) => m.weight!)
        .toList();
    
    if (weights.isEmpty) return null;
    
    return weights.reduce((a, b) => a + b) / weights.length;
  }

  Future<double?> getAverageWater({int days = 7}) async {
    final endDate = DateTime.now();
    final startDate = endDate.subtract(Duration(days: days));
    final metrics = await getMetricsInRange(startDate, endDate);
    
    final waterIntakes = metrics
        .where((m) => m.waterLiters != null)
        .map((m) => m.waterLiters!)
        .toList();
    
    if (waterIntakes.isEmpty) return null;
    
    return waterIntakes.reduce((a, b) => a + b) / waterIntakes.length;
  }

  Future<double?> getAverageSleep({int days = 7}) async {
    final endDate = DateTime.now();
    final startDate = endDate.subtract(Duration(days: days));
    final metrics = await getMetricsInRange(startDate, endDate);
    
    final sleepHours = metrics
        .where((m) => m.sleepHours != null)
        .map((m) => m.sleepHours!)
        .toList();
    
    if (sleepHours.isEmpty) return null;
    
    return sleepHours.reduce((a, b) => a + b) / sleepHours.length;
  }

  Future<WeightTrend> getWeightTrend({int days = 30}) async {
    final endDate = DateTime.now();
    final startDate = endDate.subtract(Duration(days: days));
    final metrics = await getMetricsInRange(startDate, endDate);
    
    final weights = metrics
        .where((m) => m.weight != null)
        .map((m) => WeightPoint(m.date, m.weight!))
        .toList();
    
    if (weights.length < 2) {
      return WeightTrend(
        points: weights,
        trend: WeightTrendDirection.stable,
        change: 0.0,
      );
    }
    
    final firstWeight = weights.first.weight;
    final lastWeight = weights.last.weight;
    final change = lastWeight - firstWeight;
    
    WeightTrendDirection trend;
    if (change > 1) {
      trend = WeightTrendDirection.increasing;
    } else if (change < -1) {
      trend = WeightTrendDirection.decreasing;
    } else {
      trend = WeightTrendDirection.stable;
    }
    
    return WeightTrend(
      points: weights,
      trend: trend,
      change: change,
    );
  }
}

class WeightPoint {
  final DateTime date;
  final double weight;
  
  WeightPoint(this.date, this.weight);
}

class WeightTrend {
  final List<WeightPoint> points;
  final WeightTrendDirection trend;
  final double change;
  
  WeightTrend({
    required this.points,
    required this.trend,
    required this.change,
  });
  
  String get changeDescription {
    if (change == 0) return 'No change';
    final sign = change > 0 ? '+' : '';
    return '$sign${change.toStringAsFixed(1)} lbs';
  }
}

enum WeightTrendDirection {
  increasing,
  decreasing,
  stable,
}

extension WeightTrendDirectionExtension on WeightTrendDirection {
  String get displayName {
    switch (this) {
      case WeightTrendDirection.increasing:
        return 'Increasing';
      case WeightTrendDirection.decreasing:
        return 'Decreasing';
      case WeightTrendDirection.stable:
        return 'Stable';
    }
  }
  
  String get icon {
    switch (this) {
      case WeightTrendDirection.increasing:
        return '📈';
      case WeightTrendDirection.decreasing:
        return '📉';
      case WeightTrendDirection.stable:
        return '➖';
    }
  }
}