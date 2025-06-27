import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import '../../data/models/meal_template.dart';
import '../../data/models/food_entry.dart';
import '../../data/services/template_service.dart';
import '../../data/services/database_service.dart';
import '../../data/providers/nutrition_providers.dart';
import '../common/date_time_picker_widget.dart';

class TemplateLibraryScreen extends ConsumerStatefulWidget {
  const TemplateLibraryScreen({super.key});

  @override
  ConsumerState<TemplateLibraryScreen> createState() => _TemplateLibraryScreenState();
}

class _TemplateLibraryScreenState extends ConsumerState<TemplateLibraryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  MealType? _selectedMealType;
  
  List<MealTemplate> _allTemplates = [];
  List<MealTemplate> _filteredTemplates = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _loadTemplates();
  }

  TemplateService get _templateService {
    final nutritionRepo = ref.read(nutritionRepositoryProvider);
    return TemplateService(nutritionRepo.databaseService.isar);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadTemplates() async {
    final templates = await _templateService.getAllTemplates();
    setState(() {
      _allTemplates = templates;
      _applyFilters();
    });
  }

  void _applyFilters() {
    var filtered = _allTemplates;
    
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((template) =>
          template.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          template.description.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
    }
    
    if (_selectedMealType != null) {
      filtered = filtered.where((template) => template.mealType == _selectedMealType).toList();
    }
    
    setState(() {
      _filteredTemplates = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Templates'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Favorites'),
            Tab(text: 'Recent'),
            Tab(text: 'Popular'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearchDialog(),
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(),
          ),
        ],
      ),
      body: Column(
        children: [
          if (_searchQuery.isNotEmpty || _selectedMealType != null)
            _buildActiveFilters(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTemplateGrid(_filteredTemplates),
                _buildFavoriteTemplates(),
                _buildRecentTemplates(),
                _buildPopularTemplates(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateTemplateDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildActiveFilters() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 8,
        children: [
          if (_searchQuery.isNotEmpty)
            Chip(
              label: Text('Search: $_searchQuery'),
              onDeleted: () {
                setState(() {
                  _searchQuery = '';
                });
                _applyFilters();
              },
            ),
          if (_selectedMealType != null)
            Chip(
              label: Text(_selectedMealType!.name.toUpperCase()),
              onDeleted: () {
                setState(() {
                  _selectedMealType = null;
                });
                _applyFilters();
              },
            ),
        ],
      ),
    );
  }

  Widget _buildTemplateGrid(List<MealTemplate> templates) {
    if (templates.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('No templates found'),
            Text('Create your first template from a meal!'),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadTemplates,
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: templates.length,
        itemBuilder: (context, index) => _buildTemplateCard(templates[index]),
      ),
    );
  }

  Widget _buildTemplateCard(MealTemplate template) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _showTemplateDetails(template),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Template image or placeholder
            AspectRatio(
              aspectRatio: 16 / 9,
              child: template.imageBase64?.isNotEmpty == true
                  ? Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: MemoryImage(
                            Uri.parse(template.imageBase64!).data!.contentAsBytes(),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.grey.shade200,
                      child: const Icon(
                        Icons.restaurant,
                        size: 32,
                        color: Colors.grey,
                      ),
                    ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            template.name,
                            style: Theme.of(context).textTheme.titleSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (template.isFavorite)
                          const Icon(
                            Icons.favorite,
                            size: 16,
                            color: Colors.red,
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${template.calories.toInt()} cal',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (template.mealType != null)
                      Chip(
                        label: Text(
                          template.mealType!.name.toUpperCase(),
                          style: const TextStyle(fontSize: 10),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Used ${template.usageCount}x',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                template.isFavorite ? Icons.favorite : Icons.favorite_border,
                                size: 20,
                              ),
                              onPressed: () => _toggleFavorite(template),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                            ),
                            IconButton(
                              icon: const Icon(Icons.more_vert, size: 20),
                              onPressed: () => _showTemplateOptions(template),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteTemplates() {
    return FutureBuilder<List<MealTemplate>>(
      future: _templateService.getFavoriteTemplates(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return _buildTemplateGrid(snapshot.data!);
      },
    );
  }

  Widget _buildRecentTemplates() {
    return FutureBuilder<List<MealTemplate>>(
      future: _templateService.getRecentlyUsedTemplates(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return _buildTemplateGrid(snapshot.data!);
      },
    );
  }

  Widget _buildPopularTemplates() {
    return FutureBuilder<List<MealTemplate>>(
      future: _templateService.getMostUsedTemplates(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return _buildTemplateGrid(snapshot.data!);
      },
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Templates'),
        content: TextField(
          decoration: const InputDecoration(
            labelText: 'Enter search term',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
            _applyFilters();
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter Templates'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Meal Type:'),
            const SizedBox(height: 8),
            DropdownButton<MealType?>(
              value: _selectedMealType,
              isExpanded: true,
              items: [
                const DropdownMenuItem<MealType?>(
                  value: null,
                  child: Text('All'),
                ),
                ...MealType.values.map((type) => DropdownMenuItem(
                  value: type,
                  child: Text(type.name.toUpperCase()),
                )),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedMealType = value;
                });
                _applyFilters();
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _selectedMealType = null;
              });
              _applyFilters();
            },
            child: const Text('Clear'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  Future<void> _toggleFavorite(MealTemplate template) async {
    await _templateService.toggleFavorite(template);
    _loadTemplates();
  }

  void _showTemplateOptions(MealTemplate template) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.play_arrow),
            title: const Text('Use Template'),
            onTap: () {
              Navigator.of(context).pop();
              _useTemplate(template);
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Template'),
            onTap: () {
              Navigator.of(context).pop();
              _editTemplate(template);
            },
          ),
          ListTile(
            leading: Icon(
              template.isFavorite ? Icons.favorite_border : Icons.favorite,
            ),
            title: Text(template.isFavorite ? 'Remove from Favorites' : 'Add to Favorites'),
            onTap: () {
              Navigator.of(context).pop();
              _toggleFavorite(template);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: const Text('Delete Template'),
            onTap: () {
              Navigator.of(context).pop();
              _deleteTemplate(template);
            },
          ),
        ],
      ),
    );
  }

  void _showTemplateDetails(MealTemplate template) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(template.name),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (template.description.isNotEmpty) ...[
                Text(template.description),
                const SizedBox(height: 12),
              ],
              _buildNutritionInfo(template),
              const SizedBox(height: 12),
              if (template.items.isNotEmpty) ...[
                const Text('Items:', style: TextStyle(fontWeight: FontWeight.bold)),
                ...template.items.map((item) => Padding(
                  padding: const EdgeInsets.only(left: 8, top: 4),
                  child: Text('• ${item.name} (${item.calories.toInt()} cal)'),
                )),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _useTemplate(template);
            },
            child: const Text('Use Template'),
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionInfo(MealTemplate template) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Calories:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('${template.calories.toInt()}'),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Protein:'),
              Text('${template.protein.toInt()}g'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Carbs:'),
              Text('${template.carbs.toInt()}g'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Fat:'),
              Text('${template.fat.toInt()}g'),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _useTemplate(MealTemplate template) async {
    // Show date/time selection dialog
    final selectedDateTime = await _showDateTimeDialog(template);
    if (selectedDateTime == null) return;
    
    try {
      // Use the template service to create a food entry
      final foodEntry = await _templateService.useTemplate(template, timestamp: selectedDateTime);
      
      // Save the food entry to database
      final dbService = ref.read(databaseServiceProvider);
      await dbService.saveFoodEntry(foodEntry);

      // Invalidate providers to refresh UI
      _invalidateAnalyticsProviders(selectedDateTime);

      if (mounted) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text('Added "${template.name}" to your meals'),
                ),
              ],
            ),
            backgroundColor: AppColors.success,
            action: SnackBarAction(
              label: 'Close',
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error adding template: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  void _invalidateAnalyticsProviders(DateTime affectedDate) {
    // Always invalidate global providers
    ref.invalidate(foodEntriesProvider);
    ref.invalidate(todayNutritionProvider);
    
    // Invalidate date-specific providers if they exist
    try {
      ref.invalidate(foodEntriesByDateProvider(affectedDate));
    } catch (e) {
      // Provider might not exist, ignore
    }
  }

  Future<DateTime?> _showDateTimeDialog(MealTemplate template) async {
    DateTime selectedDateTime = DateTime.now();
    
    return await showDialog<DateTime>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text('Add "${template.name}"'),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'When did you eat this?',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 16),
                DateTimePickerWidget(
                  initialDateTime: selectedDateTime,
                  onDateTimeChanged: (newDateTime) {
                    setState(() {
                      selectedDateTime = newDateTime;
                    });
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(selectedDateTime),
              child: const Text('Add Meal'),
            ),
          ],
        ),
      ),
    );
  }

  void _editTemplate(MealTemplate template) {
    // This would open an edit dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Template editing not yet implemented')),
    );
  }

  Future<void> _deleteTemplate(MealTemplate template) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Template'),
        content: Text('Are you sure you want to delete "${template.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _templateService.deleteTemplate(template.id);
      _loadTemplates();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Template deleted')),
        );
      }
    }
  }

  void _showCreateTemplateDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Create template from a food entry in the main app')),
    );
  }
}