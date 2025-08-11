import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive_helper.dart' hide ResponsiveText;
import '../../data/models/food_entry.dart';
import 'responsive_text.dart';

/// A responsive food entry card that adapts to different screen sizes
class ResponsiveFoodCard extends StatelessWidget {
  final FoodEntry foodEntry;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final bool showActions;

  const ResponsiveFoodCard({
    super.key,
    required this.foodEntry,
    this.onTap,
    this.onEdit,
    this.onDelete,
    this.showActions = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isCompact = ResponsiveHelper.shouldUseCompactLayout(context);
    final isMobile = ResponsiveHelper.isMobile(context);

    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.adaptivePadding(context) * 0.5,
        vertical: 4,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.medium,
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.medium,
        child: Padding(
          padding: EdgeInsets.all(ResponsiveHelper.adaptivePadding(context)),
          child: isCompact ? _buildCompactLayout(context) : _buildStandardLayout(context),
        ),
      ),
    );
  }

  Widget _buildCompactLayout(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with food name and actions
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodNameText(
                    foodEntry.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (foodEntry.notes?.isNotEmpty == true) ...[
                    const SizedBox(height: 4),
                    ResponsiveText(
                      foodEntry.notes!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ],
              ),
            ),
            if (showActions) _buildActionButtons(context, isCompact: true),
          ],
        ),
        const SizedBox(height: 12),
        
        // Nutrition info in vertical layout
        _buildNutritionInfo(context, isVertical: true),
        
        // Timestamp
        const SizedBox(height: 8),
        _buildTimestamp(context),
      ],
    );
  }

  Widget _buildStandardLayout(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodNameText(
                    foodEntry.name,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (foodEntry.notes?.isNotEmpty == true) ...[
                    const SizedBox(height: 4),
                    ResponsiveText(
                      foodEntry.notes!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ],
              ),
            ),
            if (showActions) _buildActionButtons(context),
          ],
        ),
        const SizedBox(height: 16),
        
        // Nutrition and timestamp row
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: _buildNutritionInfo(context),
            ),
            _buildTimestamp(context),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, {bool isCompact = false}) {
    final colorScheme = Theme.of(context).colorScheme;
    final buttonSize = isCompact ? 32.0 : 36.0;
    
    if (isCompact && (onEdit != null || onDelete != null)) {
      return PopupMenuButton<String>(
        icon: Icon(
          Icons.more_vert,
          size: 20,
          color: colorScheme.onSurfaceVariant,
        ),
        onSelected: (value) {
          switch (value) {
            case 'edit':
              onEdit?.call();
              break;
            case 'delete':
              onDelete?.call();
              break;
          }
        },
        itemBuilder: (context) => [
          if (onEdit != null)
            PopupMenuItem(
              value: 'edit',
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.edit, size: 16),
                  SizedBox(width: 8),
                  Text('Edit'),
                ],
              ),
            ),
          if (onDelete != null)
            PopupMenuItem(
              value: 'delete',
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.delete, size: 16, color: colorScheme.error),
                  SizedBox(width: 8),
                  Text('Delete', style: TextStyle(color: colorScheme.error)),
                ],
              ),
            ),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (onEdit != null)
          IconButton(
            onPressed: onEdit,
            icon: const Icon(Icons.edit),
            iconSize: 20,
            constraints: BoxConstraints.tightFor(
              width: buttonSize,
              height: buttonSize,
            ),
            style: IconButton.styleFrom(
              backgroundColor: colorScheme.surfaceVariant.withOpacity(0.5),
              foregroundColor: colorScheme.onSurfaceVariant,
            ),
          ),
        if (onEdit != null && onDelete != null) const SizedBox(width: 8),
        if (onDelete != null)
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete),
            iconSize: 20,
            constraints: BoxConstraints.tightFor(
              width: buttonSize,
              height: buttonSize,
            ),
            style: IconButton.styleFrom(
              backgroundColor: colorScheme.error.withOpacity(0.1),
              foregroundColor: colorScheme.error,
            ),
          ),
      ],
    );
  }

  Widget _buildNutritionInfo(BuildContext context, {bool isVertical = false}) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final nutritionItems = [
      _NutritionItem('Calories', '${foodEntry.calories.toInt()}', 'kcal', AppColors.secondaryOrange),
      _NutritionItem('Protein', foodEntry.protein.toStringAsFixed(1), 'g', AppColors.proteinPurple),
      _NutritionItem('Carbs', foodEntry.carbs.toStringAsFixed(1), 'g', AppColors.carbsBlue),
      _NutritionItem('Fat', foodEntry.fat.toStringAsFixed(1), 'g', AppColors.fatsYellow),
    ];

    if (isVertical) {
      return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 2.5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: nutritionItems.map((item) => _buildNutritionChip(item)).toList(),
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: nutritionItems.map((item) => _buildNutritionChip(item)).toList(),
    );
  }

  Widget _buildNutritionChip(_NutritionItem item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: item.color.withOpacity(0.1),
        borderRadius: AppRadius.small,
        border: Border.all(
          color: item.color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ResponsiveText(
            item.value,
            style: TextStyle(
              color: item.color,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            adaptive: false,
          ),
          const SizedBox(width: 2),
          ResponsiveText(
            item.unit,
            style: TextStyle(
              color: item.color.withOpacity(0.8),
              fontSize: 12,
            ),
            adaptive: false,
          ),
        ],
      ),
    );
  }

  Widget _buildTimestamp(BuildContext context) {
    final theme = Theme.of(context);
    final timeAgo = _formatTimeAgo(foodEntry.timestamp);
    
    return ResponsiveText(
      timeAgo,
      style: theme.textTheme.bodySmall?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }

  String _formatTimeAgo(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
  }
}

class _NutritionItem {
  final String label;
  final String value;
  final String unit;
  final Color color;

  const _NutritionItem(this.label, this.value, this.unit, this.color);
}

/// Skeleton loading card for food entries
class FoodCardSkeleton extends StatelessWidget {
  const FoodCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isCompact = ResponsiveHelper.shouldUseCompactLayout(context);
    
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.adaptivePadding(context) * 0.5,
        vertical: 4,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.medium,
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(ResponsiveHelper.adaptivePadding(context)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title skeleton
            Container(
              height: isCompact ? 16 : 20,
              width: double.infinity * 0.7,
              decoration: BoxDecoration(
                color: colorScheme.onSurface.withOpacity(0.1),
                borderRadius: AppRadius.small,
              ),
            ),
            const SizedBox(height: 8),
            
            // Subtitle skeleton
            Container(
              height: 14,
              width: double.infinity * 0.5,
              decoration: BoxDecoration(
                color: colorScheme.onSurface.withOpacity(0.05),
                borderRadius: AppRadius.small,
              ),
            ),
            const SizedBox(height: 16),
            
            // Nutrition chips skeleton
            Row(
              children: List.generate(
                4,
                (index) => Padding(
                  padding: EdgeInsets.only(right: index < 3 ? 8 : 0),
                  child: Container(
                    height: 28,
                    width: 60,
                    decoration: BoxDecoration(
                      color: colorScheme.onSurface.withOpacity(0.05),
                      borderRadius: AppRadius.small,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}