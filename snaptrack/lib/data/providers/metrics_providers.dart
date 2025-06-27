import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_metrics.dart';
import '../services/metrics_service.dart';

// Metrics Service Provider
final metricsServiceProvider = Provider<MetricsService>((ref) {
  throw UnimplementedError('Must be overridden in main.dart');
});

// Today's metrics
final todayMetricsProvider = StreamProvider<UserMetrics?>((ref) {
  final metricsService = ref.watch(metricsServiceProvider);
  return metricsService.watchTodayMetrics();
});

// Latest user metrics
final latestMetricsProvider = FutureProvider<UserMetrics?>((ref) {
  final metricsService = ref.watch(metricsServiceProvider);
  return metricsService.getLatestMetrics();
});

// Weight trend
final weightTrendProvider = FutureProvider<WeightTrend>((ref) {
  final metricsService = ref.watch(metricsServiceProvider);
  return metricsService.getWeightTrend();
});

// Average metrics
final averageMetricsProvider = FutureProvider<AverageMetrics>((ref) async {
  final metricsService = ref.watch(metricsServiceProvider);
  
  final avgWeight = await metricsService.getAverageWeight();
  final avgWater = await metricsService.getAverageWater();
  final avgSleep = await metricsService.getAverageSleep();
  
  return AverageMetrics(
    weight: avgWeight,
    water: avgWater,
    sleep: avgSleep,
  );
});

// Quick logging state
final quickLogStateProvider = StateNotifierProvider<QuickLogNotifier, QuickLogState>((ref) {
  return QuickLogNotifier(ref.watch(metricsServiceProvider));
});

class QuickLogNotifier extends StateNotifier<QuickLogState> {
  final MetricsService _metricsService;
  
  QuickLogNotifier(this._metricsService) : super(QuickLogState());

  Future<void> logWeight(double weight) async {
    state = state.copyWith(isLoading: true);
    try {
      await _metricsService.logWeight(weight);
      state = state.copyWith(isLoading: false, lastLoggedWeight: weight);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> logWater(double liters) async {
    state = state.copyWith(isLoading: true);
    try {
      await _metricsService.logWater(liters);
      state = state.copyWith(isLoading: false, lastLoggedWater: liters);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> addWater(double liters) async {
    state = state.copyWith(isLoading: true);
    try {
      await _metricsService.addWater(liters);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> logSleep(double hours) async {
    state = state.copyWith(isLoading: true);
    try {
      await _metricsService.logSleep(hours);
      state = state.copyWith(isLoading: false, lastLoggedSleep: hours);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

class QuickLogState {
  final bool isLoading;
  final String? error;
  final double? lastLoggedWeight;
  final double? lastLoggedWater;
  final double? lastLoggedSleep;

  QuickLogState({
    this.isLoading = false,
    this.error,
    this.lastLoggedWeight,
    this.lastLoggedWater,
    this.lastLoggedSleep,
  });

  QuickLogState copyWith({
    bool? isLoading,
    String? error,
    double? lastLoggedWeight,
    double? lastLoggedWater,
    double? lastLoggedSleep,
  }) {
    return QuickLogState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      lastLoggedWeight: lastLoggedWeight ?? this.lastLoggedWeight,
      lastLoggedWater: lastLoggedWater ?? this.lastLoggedWater,
      lastLoggedSleep: lastLoggedSleep ?? this.lastLoggedSleep,
    );
  }
}

class AverageMetrics {
  final double? weight;
  final double? water;
  final double? sleep;

  AverageMetrics({
    this.weight,
    this.water,
    this.sleep,
  });
}