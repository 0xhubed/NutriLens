import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../data/models/food_entry.dart';
import '../../data/providers/nutrition_providers.dart';
import '../../data/services/ai_provider.dart';

class CalendarView extends ConsumerStatefulWidget {
  const CalendarView({super.key});

  @override
  ConsumerState<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends ConsumerState<CalendarView> {
  DateTime _currentMonth = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  Map<DateTime, List<FoodEntry>> _entryMap = {};

  @override
  void initState() {
    super.initState();
    _loadEntriesForMonth();
  }

  Future<void> _loadEntriesForMonth() async {
    final startOfMonth = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final endOfMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
    
    final entries = await ref.read(nutritionRepositoryProvider).getEntriesInDateRange(
      startOfMonth,
      endOfMonth.add(const Duration(days: 1)),
    );
    
    // Group entries by date
    final Map<DateTime, List<FoodEntry>> entryMap = {};
    for (final entry in entries) {
      final date = DateTime(entry.timestamp.year, entry.timestamp.month, entry.timestamp.day);
      entryMap[date] = [...(entryMap[date] ?? []), entry];
    }
    
    setState(() {
      _entryMap = entryMap;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCalendarHeader(),
        _buildCalendarGrid(),
        const SizedBox(height: 16),
        _buildSelectedDateDetails(),
      ],
    );
  }

  Widget _buildCalendarHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              setState(() {
                _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
              });
              _loadEntriesForMonth();
            },
          ),
          Text(
            DateFormat('MMMM yyyy').format(_currentMonth),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              setState(() {
                _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
              });
              _loadEntriesForMonth();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    final daysInMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
    final firstDayOfMonth = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final firstWeekday = firstDayOfMonth.weekday % 7; // Sunday = 0

    const weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Weekday headers
            Row(
              children: weekdays.map((day) => Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )).toList(),
            ),
            const SizedBox(height: 8),
            // Calendar grid
            ...List.generate((daysInMonth + firstWeekday + 6) ~/ 7, (weekIndex) {
              return Row(
                children: List.generate(7, (dayIndex) {
                  final dayNumber = weekIndex * 7 + dayIndex - firstWeekday + 1;
                  
                  if (dayNumber < 1 || dayNumber > daysInMonth) {
                    return const Expanded(child: SizedBox(height: 48));
                  }
                  
                  final date = DateTime(_currentMonth.year, _currentMonth.month, dayNumber);
                  final entries = _entryMap[date] ?? [];
                  final isSelected = _isSameDay(date, _selectedDate);
                  final isToday = _isSameDay(date, DateTime.now());
                  
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDate = date;
                        });
                      },
                      child: Container(
                        height: 48,
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: isSelected 
                              ? Theme.of(context).colorScheme.primary
                              : isToday 
                                  ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                                  : null,
                          borderRadius: BorderRadius.circular(8),
                          border: isToday && !isSelected
                              ? Border.all(color: Theme.of(context).colorScheme.primary)
                              : null,
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Text(
                                dayNumber.toString(),
                                style: TextStyle(
                                  color: isSelected 
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : null,
                                  fontWeight: isToday ? FontWeight.bold : null,
                                ),
                              ),
                            ),
                            if (entries.isNotEmpty)
                              Positioned(
                                bottom: 4,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: isSelected 
                                            ? Theme.of(context).colorScheme.onPrimary
                                            : Theme.of(context).colorScheme.primary,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    if (entries.length > 1) ...[
                                      const SizedBox(width: 2),
                                      Text(
                                        '${entries.length}',
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: isSelected 
                                              ? Theme.of(context).colorScheme.onPrimary
                                              : Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedDateDetails() {
    final entries = _entryMap[_selectedDate] ?? [];
    final isToday = _isSameDay(_selectedDate, DateTime.now());
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  DateFormat('EEEE, MMMM d').format(_selectedDate),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                if (isToday) ...[
                  const SizedBox(width: 8),
                  Chip(
                    label: const Text('Today'),
                    backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 12),
            if (entries.isEmpty)
              const Text('No meals logged on this day')
            else ...[
              _buildDaySummary(entries),
              const SizedBox(height: 12),
              _buildMealsList(entries),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDaySummary(List<FoodEntry> entries) {
    final totalCalories = entries.fold<double>(0, (sum, entry) => sum + entry.calories);
    final totalProtein = entries.fold<double>(0, (sum, entry) => sum + entry.protein);
    final totalCarbs = entries.fold<double>(0, (sum, entry) => sum + entry.carbs);
    final totalFat = entries.fold<double>(0, (sum, entry) => sum + entry.fat);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Calories',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                '${totalCalories.toInt()}',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMacroItem('Protein', totalProtein, Colors.red),
              _buildMacroItem('Carbs', totalCarbs, Colors.orange),
              _buildMacroItem('Fat', totalFat, Colors.purple),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMacroItem(String label, double value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          '${value.toInt()}g',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildMealsList(List<FoodEntry> entries) {
    // Group by meal type
    final Map<MealType?, List<FoodEntry>> mealGroups = {};
    for (final entry in entries) {
      final mealType = entry.mealType ?? MealType.snack;
      mealGroups[mealType] = [...(mealGroups[mealType] ?? []), entry];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Meals (${entries.length})',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        ...mealGroups.entries.map((group) => _buildMealGroup(group.key, group.value)),
      ],
    );
  }

  Widget _buildMealGroup(MealType? mealType, List<FoodEntry> entries) {
    final mealName = mealType?.name.toUpperCase() ?? 'UNKNOWN';
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mealName,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          ...entries.map((entry) => Padding(
            padding: const EdgeInsets.only(left: 8, top: 4),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    entry.portions.isNotEmpty
                        ? '${entry.name} (${entry.portionSummary})'
                        : entry.name,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Text(
                  '${entry.calories.toInt()} cal',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}