
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../data/models/food_entry.dart';
import '../../data/providers/nutrition_providers.dart';
import '../../data/services/database_service.dart';
import '../../data/services/analytics_service.dart';
import '../../data/services/template_service.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  bool _isSelectionMode = false;
  final Set<String> _selectedEntries = {};
  bool _isGridView = false;

  void _invalidateAnalyticsProviders(DateTime affectedDate) {
    // Always invalidate global providers
    ref.invalidate(foodEntriesProvider);
    ref.invalidate(todayNutritionProvider);
    
    // Invalidate date-specific providers
    ref.invalidate(foodEntriesByDateProvider(affectedDate));
    ref.invalidate(dailyProgressProvider(affectedDate));
    ref.invalidate(dailyProgressProvider(null)); // Today's progress
    
    // Invalidate weekly stats for the affected week
    final weekStart = _getWeekStart(affectedDate);
    ref.invalidate(weeklyStatsProvider(weekStart));
    
    // Invalidate current week if different
    final currentWeekStart = _getWeekStart(DateTime.now());
    if (weekStart != currentWeekStart) {
      ref.invalidate(weeklyStatsProvider(currentWeekStart));
    }
  }

  DateTime _getWeekStart(DateTime date) {
    final daysFromMonday = date.weekday - 1;
    return DateTime(date.year, date.month, date.day - daysFromMonday);
  }

  @override
  Widget build(BuildContext context) {
    final foodEntriesAsync = ref.watch(foodEntriesProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(_isSelectionMode 
            ? '${_selectedEntries.length} selected' 
            : 'Food History'),
        leading: _isSelectionMode 
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: _exitSelectionMode,
              )
            : null,
        actions: [
          if (!_isSelectionMode) ...[
            IconButton(
              icon: Icon(_isGridView ? Icons.list : Icons.grid_view),
              onPressed: () => setState(() => _isGridView = !_isGridView),
              tooltip: _isGridView ? 'List View' : 'Grid View',
            ),
            IconButton(
              icon: const Icon(Icons.select_all),
              onPressed: () => setState(() => _isSelectionMode = true),
              tooltip: 'Select Entries',
            ),
          ] else ...[
            IconButton(
              icon: const Icon(Icons.select_all),
              onPressed: _selectAll,
              tooltip: 'Select All',
            ),
            if (_selectedEntries.isNotEmpty) ...[
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: _selectedEntries.length == 1 ? _editSelectedEntry : null,
                tooltip: 'Edit Entry',
              ),
              IconButton(
                icon: const Icon(Icons.bookmark_add),
                onPressed: _selectedEntries.length == 1 ? _saveSelectedAsTemplate : null,
                tooltip: 'Save as Template',
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: _deleteSelectedEntries,
                tooltip: 'Delete Selected',
              ),
            ],
          ],
        ],
      ),
      body: foodEntriesAsync.when(
        data: (entries) {
          if (entries.isEmpty) {
            return _buildEmptyState();
          }
          return _isGridView 
              ? _buildFoodGrid(entries, ref)
              : _buildFoodList(entries, ref);
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
      floatingActionButton: _isSelectionMode && _selectedEntries.isNotEmpty
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_selectedEntries.length == 1)
                  FloatingActionButton(
                    heroTag: "edit",
                    onPressed: _editSelectedEntry,
                    backgroundColor: Colors.blue,
                    child: const Icon(Icons.edit),
                  ),
                if (_selectedEntries.length == 1) const SizedBox(height: 8),
                if (_selectedEntries.length == 1)
                  FloatingActionButton(
                    heroTag: "template",
                    onPressed: _saveSelectedAsTemplate,
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.bookmark_add),
                  ),
                if (_selectedEntries.length == 1) const SizedBox(height: 8),
                FloatingActionButton(
                  heroTag: "delete",
                  onPressed: _deleteSelectedEntries,
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.delete),
                ),
              ],
            )
          : null,
    );
  }

  void _exitSelectionMode() {
    setState(() {
      _isSelectionMode = false;
      _selectedEntries.clear();
    });
  }

  Future<void> _selectAll() async {
    final entries = await ref.read(foodEntriesProvider.future);
    setState(() {
      _selectedEntries.clear();
      _selectedEntries.addAll(entries.map((e) => e.id).where((id) => id != null).cast<String>());
    });
  }

  void _toggleSelection(String? entryId) {
    if (entryId == null) return;
    setState(() {
      if (_selectedEntries.contains(entryId)) {
        _selectedEntries.remove(entryId);
      } else {
        _selectedEntries.add(entryId);
      }
      
      if (_selectedEntries.isEmpty) {
        _isSelectionMode = false;
      }
    });
  }

  Future<void> _editSelectedEntry() async {
    if (_selectedEntries.length != 1) return;
    
    final entryId = _selectedEntries.first;
    final entries = await ref.read(foodEntriesProvider.future);
    final entry = entries.firstWhere((e) => e.id == entryId);
    
    if (mounted) {
      final result = await showDialog<bool>(
        context: context,
        builder: (context) => _EditEntryDialog(
          entry: entry,
          onSaveTemplate: (entry) => _showSaveAsTemplateDialog(context, entry),
        ),
      );
      
      if (result == true) {
        _exitSelectionMode();
        _invalidateAnalyticsProviders(entry.timestamp);
      }
    }
  }

  Future<void> _saveSelectedAsTemplate() async {
    if (_selectedEntries.length != 1) return;
    
    final entryId = _selectedEntries.first;
    final entries = await ref.read(foodEntriesProvider.future);
    final entry = entries.firstWhere((e) => e.id == entryId);
    
    if (mounted) {
      await _showSaveAsTemplateDialog(context, entry);
      _exitSelectionMode();
    }
  }

  Future<void> _editEntry(FoodEntry entry) async {
    if (mounted) {
      final result = await showDialog<bool>(
        context: context,
        builder: (context) => _EditEntryDialog(
          entry: entry,
          onSaveTemplate: (entry) => _showSaveAsTemplateDialog(context, entry),
        ),
      );
      
      if (result == true) {
        _invalidateAnalyticsProviders(entry.timestamp);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Food entry updated successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    }
  }

  Future<void> _deleteEntry(FoodEntry entry) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Entry'),
        content: Text('Are you sure you want to delete "${entry.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final dbService = ref.read(databaseServiceProvider);
      if (entry.id != null) {
        await dbService.deleteFoodEntry(entry.id!);
      }
      _invalidateAnalyticsProviders(entry.timestamp);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${entry.name} deleted'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _deleteSelectedEntries() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Entries'),
        content: Text('Delete ${_selectedEntries.length} selected entries?'),
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

    if (confirmed == true) {
      final dbService = ref.read(databaseServiceProvider);
      final entries = await ref.read(foodEntriesProvider.future);
      final entriesToDelete = entries.where((e) => _selectedEntries.contains(e.id)).toList();
      
      for (final entryId in _selectedEntries) {
        await dbService.deleteFoodEntry(entryId);
      }
      
      // Invalidate analytics for all affected dates
      for (final entry in entriesToDelete) {
        _invalidateAnalyticsProviders(entry.timestamp);
      }
      
      _exitSelectionMode();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${_selectedEntries.length} entries deleted')),
        );
      }
    }
  }

  Future<void> _showSaveAsTemplateDialog(BuildContext context, FoodEntry entry) async {
    final TextEditingController nameController = TextEditingController(text: entry.name);
    final TextEditingController descriptionController = TextEditingController(
      text: 'Template based on ${entry.name}',
    );
    
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Save as Template'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Template Name',
                  hintText: 'Enter a name for this template',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description (optional)',
                  hintText: 'Add a description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Template will include:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text('• ${entry.calories.toStringAsFixed(0)} calories'),
                    Text('• ${entry.protein.toStringAsFixed(1)}g protein'),
                    Text('• ${entry.carbs.toStringAsFixed(1)}g carbs'),
                    Text('• ${entry.fat.toStringAsFixed(1)}g fat'),
                    if (entry.detectedItems.isNotEmpty)
                      Text('• ${entry.detectedItems.length} food items'),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final templateName = nameController.text.trim();
              if (templateName.isEmpty) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a template name'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                }
                return;
              }
              
              Navigator.of(dialogContext).pop({
                'name': templateName,
                'description': descriptionController.text.trim(),
              });
            },
            child: const Text('Save Template'),
          ),
        ],
      ),
    );
    
    if (result != null && mounted) {
      try {
        // Get the database service and create template service
        final dbService = ref.read(databaseServiceProvider);
        final templateService = TemplateService();
        
        // Create template from food entry
        await templateService.createTemplate(
          entry,
          customName: result['name']!.isNotEmpty ? result['name'] : null,
        );
        
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Template "${result['name']}" created successfully'),
              backgroundColor: Colors.green,
              action: SnackBarAction(
                label: 'View Templates',
                onPressed: () {
                  // You can navigate to templates screen if it exists
                  // Navigator.of(context).pushNamed('/templates');
                },
              ),
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error creating template: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
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

  Widget _buildFoodGrid(List<FoodEntry> entries, WidgetRef ref) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        return _buildFoodGridCard(entry, ref);
      },
    );
  }

  Widget _buildFoodGridCard(FoodEntry entry, WidgetRef ref) {
    final isSelected = _selectedEntries.contains(entry.id);
    
    return GestureDetector(
      onTap: () {
        if (_isSelectionMode) {
          _toggleSelection(entry.id);
        } else {
          _viewEntryDetails(entry);
        }
      },
      onLongPress: () {
        if (!_isSelectionMode) {
          setState(() => _isSelectionMode = true);
        }
        _toggleSelection(entry.id);
      },
      child: Card(
        elevation: isSelected ? 8 : 2,
        color: isSelected ? Theme.of(context).colorScheme.primaryContainer : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: _buildFoodImage(entry.imageBase64),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.portions.isNotEmpty
                          ? '${entry.name} (${entry.portionSummary})'
                          : entry.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${entry.calories.toStringAsFixed(0)} kcal',
                      style: TextStyle(
                        color: Colors.orange[700],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('MMM d').format(entry.timestamp),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          DateFormat('HH:mm').format(entry.timestamp),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (isSelected)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            if (!_isSelectionMode)
              Positioned(
                bottom: 8,
                right: 8,
                child: IconButton(
                  icon: const Icon(Icons.edit, size: 16),
                  onPressed: () => _editEntry(entry),
                  tooltip: 'Edit Entry',
                  style: IconButton.styleFrom(
                    minimumSize: const Size(28, 28),
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.9),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _viewEntryDetails(FoodEntry entry) {
    showDialog(
      context: context,
      builder: (context) => _ViewEntryDialog(
        entry: entry,
        onEdit: () => _editEntry(entry),
        onSaveTemplate: (entry) => _showSaveAsTemplateDialog(context, entry),
        onDelete: () => _deleteEntry(entry),
      ),
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
    final isSelected = _selectedEntries.contains(entry.id);
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: isSelected ? 8 : 2,
      color: isSelected ? Theme.of(context).colorScheme.primaryContainer : null,
      child: _isSelectionMode
          ? ListTile(
              leading: _buildFoodImage(entry.imageBase64),
              title: Text(
                entry.portions.isNotEmpty
                    ? '${entry.name} (${entry.portionSummary})'
                    : entry.name,
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
                  if (entry.actualWeight != 100.0)
                    Text(
                      'Weight: ${entry.actualWeight.toStringAsFixed(0)}g',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.blue[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    DateFormat('HH:mm').format(entry.timestamp),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Checkbox(
                    value: isSelected,
                    onChanged: (_) => _toggleSelection(entry.id),
                  ),
                ],
              ),
              onTap: () => _toggleSelection(entry.id),
              onLongPress: () => _toggleSelection(entry.id),
            )
          : Dismissible(
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
                  context: context,
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
                if (entry.id != null) {
        await dbService.deleteFoodEntry(entry.id!);
      }
                _invalidateAnalyticsProviders(entry.timestamp);
                
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${entry.name} deleted')),
                  );
                }
              },
              child: ListTile(
                leading: _buildFoodImage(entry.imageBase64),
                title: Text(
                  entry.portions.isNotEmpty
                      ? '${entry.name} (${entry.portionSummary})'
                      : entry.name,
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
                    if (entry.actualWeight != 100.0)
                      Text(
                        'Weight: ${entry.actualWeight.toStringAsFixed(0)}g',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.blue[600],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      DateFormat('HH:mm').format(entry.timestamp),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.edit, size: 18),
                      onPressed: () => _editEntry(entry),
                      tooltip: 'Edit Entry',
                      style: IconButton.styleFrom(
                        minimumSize: const Size(32, 32),
                        backgroundColor: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
                onTap: () => _viewEntryDetails(entry),
                onLongPress: () {
                  setState(() => _isSelectionMode = true);
                  _toggleSelection(entry.id);
                },
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

class _ViewEntryDialog extends StatelessWidget {
  final FoodEntry entry;
  final VoidCallback? onEdit;
  final Function(FoodEntry)? onSaveTemplate;
  final VoidCallback? onDelete;

  const _ViewEntryDialog({
    required this.entry, 
    this.onEdit,
    this.onSaveTemplate,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(entry.name),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Food image
            if (entry.imageBase64.isNotEmpty)
              Container(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.fastfood, size: 64),
              ),
            
            // Nutrition info
            _buildInfoRow('Calories', '${entry.calories.toStringAsFixed(0)} kcal'),
            _buildInfoRow('Protein', '${entry.protein.toStringAsFixed(1)} g'),
            _buildInfoRow('Carbs', '${entry.carbs.toStringAsFixed(1)} g'),
            _buildInfoRow('Fat', '${entry.fat.toStringAsFixed(1)} g'),
            const Divider(),
            _buildInfoRow('Meal Type', entry.mealType.name),
            _buildInfoRow('Date', DateFormat('MMM d, yyyy').format(entry.timestamp)),
            _buildInfoRow('Time', DateFormat('HH:mm').format(entry.timestamp)),
            if (entry.cuisine != CuisineType.other)
              _buildInfoRow('Cuisine', entry.cuisine.name),
            if (entry.aiProvider != null)
              _buildInfoRow('AI Provider', entry.aiProvider!),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
        if (onSaveTemplate != null)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onSaveTemplate!(entry);
            },
            child: const Text('Save as Template'),
          ),
        if (onDelete != null)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onDelete!();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('Delete'),
          ),
        if (onEdit != null)
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              onEdit!();
            },
            child: const Text('Edit'),
          ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

class _EditEntryDialog extends ConsumerStatefulWidget {
  final FoodEntry entry;
  final Function(FoodEntry)? onSaveTemplate;

  const _EditEntryDialog({
    required this.entry,
    this.onSaveTemplate,
  });

  @override
  ConsumerState<_EditEntryDialog> createState() => _EditEntryDialogState();
}

class _EditEntryDialogState extends ConsumerState<_EditEntryDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _caloriesController;
  late final TextEditingController _proteinController;
  late final TextEditingController _carbsController;
  late final TextEditingController _fatController;
  late final TextEditingController _weightController;
  late MealType _selectedMealType;
  late DateTime _selectedDateTime;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.entry.name);
    _caloriesController = TextEditingController(text: widget.entry.calories.toString());
    _proteinController = TextEditingController(text: widget.entry.protein.toString());
    _carbsController = TextEditingController(text: widget.entry.carbs.toString());
    _fatController = TextEditingController(text: widget.entry.fat.toString());
    _weightController = TextEditingController(text: widget.entry.actualWeight.toString());
    _selectedMealType = widget.entry.mealType;
    _selectedDateTime = widget.entry.timestamp;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _caloriesController.dispose();
    _proteinController.dispose();
    _carbsController.dispose();
    _fatController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Entry'),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Food Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _caloriesController,
                      decoration: const InputDecoration(
                        labelText: 'Calories',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _weightController,
                      decoration: const InputDecoration(
                        labelText: 'Weight (g)',
                        border: OutlineInputBorder(),
                        suffixText: 'g',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<MealType>(
                value: _selectedMealType,
                decoration: const InputDecoration(
                  labelText: 'Meal Type',
                  border: OutlineInputBorder(),
                ),
                items: MealType.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() => _selectedMealType = value!);
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _proteinController,
                      decoration: const InputDecoration(
                        labelText: 'Protein (g)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _carbsController,
                      decoration: const InputDecoration(
                        labelText: 'Carbs (g)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _fatController,
                      decoration: const InputDecoration(
                        labelText: 'Fat (g)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _selectDate,
                      child: Text(
                        DateFormat('MMM d, yyyy').format(_selectedDateTime),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _selectTime,
                      child: Text(
                        DateFormat('HH:mm').format(_selectedDateTime),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        if (widget.onSaveTemplate != null)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
              widget.onSaveTemplate!(widget.entry);
            },
            child: const Text('Save as Template'),
          ),
        FilledButton(
          onPressed: _saveChanges,
          child: const Text('Save'),
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );
    
    if (date != null) {
      setState(() {
        _selectedDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          _selectedDateTime.hour,
          _selectedDateTime.minute,
        );
      });
    }
  }

  Future<void> _selectTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
    );
    
    if (time != null) {
      setState(() {
        _selectedDateTime = DateTime(
          _selectedDateTime.year,
          _selectedDateTime.month,
          _selectedDateTime.day,
          time.hour,
          time.minute,
        );
      });
    }
  }

  Future<void> _saveChanges() async {
    try {
      final weightText = _weightController.text.trim();
      final updatedWeight = weightText.isNotEmpty ? double.tryParse(weightText) : null;
      
      final updatedEntry = FoodEntry()
        ..id = widget.entry.id
        ..name = _nameController.text.trim()
        ..calories = double.parse(_caloriesController.text)
        ..protein = double.parse(_proteinController.text)
        ..carbs = double.parse(_carbsController.text)
        ..fat = double.parse(_fatController.text)
        ..userWeight = updatedWeight
        ..estimatedWeight = widget.entry.estimatedWeight
        ..mealType = _selectedMealType
        ..timestamp = _selectedDateTime
        ..imageBase64 = widget.entry.imageBase64
        ..foodGroups = widget.entry.foodGroups
        ..cuisine = widget.entry.cuisine
        ..dietaryTags = widget.entry.dietaryTags
        ..portionSize = widget.entry.portionSize
        ..cookingMethod = widget.entry.cookingMethod
        ..detectedItems = widget.entry.detectedItems
        ..aiProvider = widget.entry.aiProvider;

      final dbService = ref.read(databaseServiceProvider);
      await dbService.updateFoodEntry(updatedEntry);

      if (mounted) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Entry updated successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating entry: $e')),
        );
      }
    }
  }
}

