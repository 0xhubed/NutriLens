import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/theme/app_theme.dart';

class DateTimePickerWidget extends StatefulWidget {
  final DateTime initialDateTime;
  final ValueChanged<DateTime> onDateTimeChanged;
  final String? label;
  final bool showTimeFirst;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const DateTimePickerWidget({
    super.key,
    required this.initialDateTime,
    required this.onDateTimeChanged,
    this.label,
    this.showTimeFirst = false,
    this.firstDate,
    this.lastDate,
  });

  @override
  State<DateTimePickerWidget> createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  late DateTime _selectedDateTime;

  @override
  void initState() {
    super.initState();
    _selectedDateTime = widget.initialDateTime;
  }

  @override
  void didUpdateWidget(DateTimePickerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialDateTime != oldWidget.initialDateTime) {
      _selectedDateTime = widget.initialDateTime;
    }
  }

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: widget.firstDate ?? DateTime.now().subtract(const Duration(days: 365)),
      lastDate: widget.lastDate ?? DateTime.now().add(const Duration(days: 1)), // Allow future entries
    );

    if (date != null) {
      final newDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        _selectedDateTime.hour,
        _selectedDateTime.minute,
      );
      
      setState(() {
        _selectedDateTime = newDateTime;
      });
      
      widget.onDateTimeChanged(newDateTime);
    }
  }

  Future<void> _selectTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
    );

    if (time != null) {
      final newDateTime = DateTime(
        _selectedDateTime.year,
        _selectedDateTime.month,
        _selectedDateTime.day,
        time.hour,
        time.minute,
      );
      
      setState(() {
        _selectedDateTime = newDateTime;
      });
      
      widget.onDateTimeChanged(newDateTime);
    }
  }

  String _getRelativeDateLabel(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateOnly = DateTime(dateTime.year, dateTime.month, dateTime.day);
    
    final difference = today.difference(dateOnly).inDays;
    
    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference == -1) {
      return 'Tomorrow';
    } else if (difference > 1 && difference <= 7) {
      return '${difference} days ago';
    } else if (difference < -1 && difference >= -7) {
      return 'In ${-difference} days';
    } else {
      return DateFormat('MMM d, yyyy').format(dateTime);
    }
  }

  String _getMealTimeContext(DateTime dateTime) {
    final hour = dateTime.hour;
    if (hour >= 5 && hour < 11) {
      return 'Breakfast time';
    } else if (hour >= 11 && hour < 16) {
      return 'Lunch time';
    } else if (hour >= 16 && hour < 22) {
      return 'Dinner time';
    } else {
      return 'Snack time';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isToday = _isSameDay(_selectedDateTime, DateTime.now());
    final isPast = _selectedDateTime.isBefore(DateTime.now());
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
        ],
        
        // Status indicator
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isToday 
                ? AppColors.primaryGreen.withOpacity(0.1)
                : isPast 
                    ? AppColors.secondaryOrange.withOpacity(0.1)
                    : AppColors.info.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isToday 
                    ? Icons.today
                    : isPast 
                        ? Icons.history
                        : Icons.schedule,
                size: 16,
                color: isToday 
                    ? AppColors.primaryGreen
                    : isPast 
                        ? AppColors.secondaryOrange
                        : AppColors.info,
              ),
              const SizedBox(width: 6),
              Text(
                _getRelativeDateLabel(_selectedDateTime),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isToday 
                      ? AppColors.primaryGreen
                      : isPast 
                          ? AppColors.secondaryOrange
                          : AppColors.info,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '• ${_getMealTimeContext(_selectedDateTime)}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 12),
        
        // Date and Time selectors
        Row(
          children: [
            Expanded(
              flex: 2,
              child: OutlinedButton.icon(
                onPressed: _selectDate,
                icon: const Icon(Icons.calendar_today, size: 18),
                label: Text(
                  DateFormat('MMM d, yyyy').format(_selectedDateTime),
                  style: const TextStyle(fontSize: 14),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _selectTime,
                icon: const Icon(Icons.access_time, size: 18),
                label: Text(
                  DateFormat('HH:mm').format(_selectedDateTime),
                  style: const TextStyle(fontSize: 14),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
            ),
          ],
        ),
        
        // Helper text for past entries
        if (isPast && !isToday) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 14,
                color: colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Adding meal entry for a past date',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
           date1.month == date2.month &&
           date1.day == date2.day;
  }
}

/// Quick preset buttons for common date/time selections
class DateTimePresets extends StatelessWidget {
  final ValueChanged<DateTime> onPresetSelected;

  const DateTimePresets({
    super.key,
    required this.onPresetSelected,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Select',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildPresetChip(
              context,
              'Now',
              now,
              Icons.access_time,
            ),
            _buildPresetChip(
              context,
              'This Morning',
              DateTime(now.year, now.month, now.day, 8, 0),
              Icons.wb_sunny,
            ),
            _buildPresetChip(
              context,
              'Yesterday',
              DateTime(now.year, now.month, now.day - 1, now.hour, now.minute),
              Icons.history,
            ),
            _buildPresetChip(
              context,
              'This Morning',
              DateTime(now.year, now.month, now.day, 8, 0),
              Icons.breakfast_dining,
            ),
            _buildPresetChip(
              context,
              'Lunch Time',
              DateTime(now.year, now.month, now.day, 12, 30),
              Icons.lunch_dining,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPresetChip(
    BuildContext context,
    String label,
    DateTime dateTime,
    IconData icon,
  ) {
    return ActionChip(
      avatar: Icon(icon, size: 16),
      label: Text(label),
      onPressed: () => onPresetSelected(dateTime),
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
    );
  }
}