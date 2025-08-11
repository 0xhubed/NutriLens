import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/utils/responsive_helper.dart' hide ResponsiveText;
import '../../core/theme/app_theme.dart';
import 'responsive_text.dart';

/// Wrapper for charts that ensures proper sizing and text visibility
class ResponsiveChartWrapper extends StatelessWidget {
  final Widget chart;
  final String? title;
  final String? subtitle;
  final List<ChartLegendItem>? legendItems;
  final Widget? actions;
  final double? height;

  const ResponsiveChartWrapper({
    super.key,
    required this.chart,
    this.title,
    this.subtitle,
    this.legendItems,
    this.actions,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isCompact = ResponsiveHelper.shouldUseCompactLayout(context);
    
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.large,
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(ResponsiveHelper.adaptivePadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null || actions != null) ...[
              _buildHeader(context),
              SizedBox(height: ResponsiveHelper.adaptiveSpacing(context, base: 16)),
            ],
            
            // Chart container with responsive height
            Container(
              height: height ?? (isCompact ? 200 : 250),
              child: chart,
            ),
            
            if (legendItems != null && legendItems!.isNotEmpty) ...[
              SizedBox(height: ResponsiveHelper.adaptiveSpacing(context, base: 12)),
              _buildLegend(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isCompact = ResponsiveHelper.shouldUseCompactLayout(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Expanded(
                child: ResponsiveText(
                  title!,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  baseFontSize: isCompact ? 18 : 20,
                  maxLines: 2,
                ),
              ),
            ],
            if (actions != null) ...[
              const SizedBox(width: 8),
              actions!,
            ],
          ],
        ),
        
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          ResponsiveText(
            subtitle!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            maxLines: 2,
          ),
        ],
      ],
    );
  }

  Widget _buildLegend(BuildContext context) {
    final isCompact = ResponsiveHelper.shouldUseCompactLayout(context);
    final itemsPerRow = isCompact ? 2 : 4;
    
    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: legendItems!.map((item) => _LegendItem(
        item: item,
        isCompact: isCompact,
      )).toList(),
    );
  }
}

/// Individual legend item widget
class _LegendItem extends StatelessWidget {
  final ChartLegendItem item;
  final bool isCompact;

  const _LegendItem({
    required this.item,
    required this.isCompact,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: item.color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Flexible(
          child: ResponsiveText(
            item.label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
            ),
            baseFontSize: isCompact ? 11 : 12,
            maxLines: 1,
            tooltip: item.label,
          ),
        ),
        if (item.value != null) ...[
          const SizedBox(width: 4),
          ResponsiveText(
            item.value!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w400,
            ),
            baseFontSize: isCompact ? 10 : 11,
          ),
        ],
      ],
    );
  }
}

/// Data class for chart legend items
class ChartLegendItem {
  final String label;
  final Color color;
  final String? value;

  const ChartLegendItem({
    required this.label,
    required this.color,
    this.value,
  });
}

/// Responsive pie chart titles that prevent overlap
class ResponsivePieChartTitles {
  static Widget Function(int, TitleMeta) getResponsiveTitles(
    BuildContext context,
    List<String> labels, {
    bool showLabels = true,
    bool showValues = true,
  }) {
    final isCompact = ResponsiveHelper.shouldUseCompactLayout(context);
    
    return (int value, TitleMeta meta) {
      if (!showLabels && !showValues) return const SizedBox.shrink();
      
      final label = value < labels.length ? labels[value] : '';
      final fontSize = ResponsiveHelper.adaptiveFontSize(context, base: isCompact ? 10 : 12);
      
      // Show only percentage on very small screens
      if (isCompact && label.length > 6) {
        return Text(
          '${meta.formattedValue}%',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        );
      }
      
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showLabels)
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          if (showValues && showLabels) const SizedBox(height: 2),
          if (showValues)
            Text(
              '${meta.formattedValue}%',
              style: TextStyle(
                fontSize: fontSize * 0.9,
                fontWeight: FontWeight.w400,
                color: Colors.white70,
              ),
            ),
        ],
      );
    };
  }
}

/// Responsive bar chart titles
class ResponsiveBarChartTitles {
  static Widget Function(double, TitleMeta) getBottomTitles(
    BuildContext context,
    List<String> labels, {
    double? interval,
    bool rotateLabels = false,
  }) {
    final isCompact = ResponsiveHelper.shouldUseCompactLayout(context);
    final fontSize = ResponsiveHelper.adaptiveFontSize(context, base: isCompact ? 10 : 12);
    
    return (double value, TitleMeta meta) {
      final index = value.toInt();
      if (index < 0 || index >= labels.length) return const SizedBox.shrink();
      
      String label = labels[index];
      
      // Abbreviate labels on compact screens
      if (isCompact && label.length > 3) {
        if (label.contains(' ')) {
          // Take first letter of each word
          label = label.split(' ').map((word) => word.isNotEmpty ? word[0].toUpperCase() : '').join('');
        } else if (label.length > 3) {
          // Truncate to 3 characters
          label = label.substring(0, 3).toUpperCase();
        }
      }
      
      Widget textWidget = Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
      
      if (rotateLabels && !isCompact) {
        return Transform.rotate(
          angle: -0.5,
          child: textWidget,
        );
      }
      
      return Padding(
        padding: const EdgeInsets.only(top: 4),
        child: textWidget,
      );
    };
  }

  static Widget Function(double, TitleMeta) getLeftTitles(
    BuildContext context, {
    String suffix = '',
  }) {
    final isCompact = ResponsiveHelper.shouldUseCompactLayout(context);
    final fontSize = ResponsiveHelper.adaptiveFontSize(context, base: isCompact ? 9 : 11);
    
    return (double value, TitleMeta meta) {
      return Text(
        '${value.toInt()}$suffix',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      );
    };
  }
}

/// Responsive line chart titles
class ResponsiveLineChartTitles {
  static Widget Function(double, TitleMeta) getBottomTitles(
    BuildContext context,
    List<String> labels, {
    int? maxLabels,
  }) {
    final isCompact = ResponsiveHelper.shouldUseCompactLayout(context);
    final fontSize = ResponsiveHelper.adaptiveFontSize(context, base: isCompact ? 9 : 11);
    final effectiveMaxLabels = maxLabels ?? (isCompact ? 4 : 7);
    
    return (double value, TitleMeta meta) {
      final index = value.toInt();
      if (index < 0 || index >= labels.length) return const SizedBox.shrink();
      
      // Skip labels if we have too many for the screen
      if (labels.length > effectiveMaxLabels) {
        final step = labels.length / effectiveMaxLabels;
        if (index % step.round() != 0) return const SizedBox.shrink();
      }
      
      return Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          labels[index],
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    };
  }
}