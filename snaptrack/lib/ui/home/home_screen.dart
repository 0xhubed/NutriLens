import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/daily_nutrition.dart';
import '../../data/providers/nutrition_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayNutrition = ref.watch(todayNutritionProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnapTrack'),
        actions: [
          IconButton(
            icon: const Icon(Icons.library_books),
            onPressed: () => context.push('/templates'),
            tooltip: 'Meal Templates',
          ),
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => context.push('/history'),
            tooltip: 'History',
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
            tooltip: 'AI Provider Settings',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDailySummaryCard(todayNutrition),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => context.push('/camera'),
              icon: const Icon(Icons.camera_alt),
              label: const Text('Add Food'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.all(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildDailySummaryCard(AsyncValue<DailyNutrition?> nutritionAsync) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: nutritionAsync.when(
          data: (nutrition) {
            if (nutrition == null) {
              return _buildEmptyState();
            }
            return _buildNutritionSummary(nutrition);
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
    );
  }
  
  Widget _buildEmptyState() {
    return Column(
      children: [
        const Icon(
          Icons.restaurant_menu,
          size: 64,
          color: Colors.grey,
        ),
        const SizedBox(height: 16),
        Text(
          'No meals logged today',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Tap "Add Food" to get started',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
  
  Widget _buildNutritionSummary(DailyNutrition nutrition) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Today\'s Summary',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildNutritionRow('Calories', '${nutrition.totalCalories.toStringAsFixed(0)} kcal'),
        const SizedBox(height: 8),
        _buildNutritionRow('Protein', '${nutrition.totalProtein.toStringAsFixed(1)}g'),
        const SizedBox(height: 8),
        _buildNutritionRow('Carbs', '${nutrition.totalCarbs.toStringAsFixed(1)}g'),
        const SizedBox(height: 8),
        _buildNutritionRow('Fat', '${nutrition.totalFat.toStringAsFixed(1)}g'),
        const Divider(height: 24),
        Text(
          '${nutrition.mealCount} meals logged',
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
  
  Widget _buildNutritionRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}