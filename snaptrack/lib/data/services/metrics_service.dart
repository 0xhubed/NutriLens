import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../models/user_metrics.dart';

final metricsServiceProvider = Provider<MetricsService>((ref) {
  return MetricsService();
});

class MetricsService {
  Box<UserMetrics> get _metricsBox => Hive.box<UserMetrics>('userMetrics');
  
  MetricsService();

  // User Metrics CRUD operations
  Future<void> saveMetrics(UserMetrics metrics) async {
    // Generate key based on date
    final dateKey = _generateDateKey(metrics.date);
    await _metricsBox.put(dateKey, metrics);
  }

  Future<void> updateMetrics(UserMetrics metrics) async {
    final dateKey = _generateDateKey(metrics.date);
    await _metricsBox.put(dateKey, metrics);
  }

  Future<UserMetrics?> getMetricsForDate(DateTime date) async {
    final dateKey = _generateDateKey(date);
    return _metricsBox.get(dateKey);
  }

  Future<UserMetrics?> getLatestMetrics() async {
    final metrics = _metricsBox.values.toList()
      ..sort((a, b) => b.date.compareTo(a.date));
    
    return metrics.isNotEmpty ? metrics.first : null;
  }

  Future<List<UserMetrics>> getMetricsInRange(DateTime startDate, DateTime endDate) async {
    return _metricsBox.values
        .where((metrics) =>
            metrics.date.isAfter(startDate) &&
            metrics.date.isBefore(endDate))
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));
  }

  Stream<UserMetrics?> watchTodayMetrics() {
    final today = DateTime.now();
    final dateKey = _generateDateKey(today);
    
    print('📊 MetricsService: Setting up watchTodayMetrics stream...');
    
    // Use periodic polling as workaround for Hive watch issues
    return Stream.periodic(Duration(milliseconds: 500)).map((_) {
      final metrics = _metricsBox.get(dateKey);
      print('📊 MetricsService: Today metrics check: ${metrics?.weight ?? 0} weight');
      return metrics;
    }).distinct((prev, next) => 
      (prev?.weight ?? 0) == (next?.weight ?? 0) &&
      (prev?.waterLiters ?? 0) == (next?.waterLiters ?? 0) &&
      (prev?.sleepHours ?? 0) == (next?.sleepHours ?? 0)
    );
  }

  Stream<List<UserMetrics>> watchAllMetrics() {
    print('📊 MetricsService: Setting up watchAllMetrics stream...');
    
    // Use periodic polling as workaround for Hive watch issues
    return Stream.periodic(Duration(milliseconds: 500)).map((_) {
      final metrics = _metricsBox.values.toList()
        ..sort((a, b) => b.date.compareTo(a.date));
      print('📊 MetricsService: All metrics check: ${metrics.length} entries');
      return metrics;
    }).distinct((prev, next) => prev.length == next.length && 
      (prev.isEmpty || next.isEmpty || prev.first.date == next.first.date));
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
  
  // Helper method to generate consistent date keys
  String _generateDateKey(DateTime date) {
    final dateOnly = DateTime(date.year, date.month, date.day);
    return '${dateOnly.year}-${dateOnly.month.toString().padLeft(2, '0')}-${dateOnly.day.toString().padLeft(2, '0')}';
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