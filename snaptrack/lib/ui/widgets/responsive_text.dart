import 'package:flutter/material.dart';
import '../../core/utils/responsive_helper.dart';

/// A widget that handles text display with responsive sizing and overflow protection
class ResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool adaptive;
  final double? baseFontSize;
  final String? tooltip;

  const ResponsiveText(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.adaptive = true,
    this.baseFontSize,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ?? Theme.of(context).textTheme.bodyMedium!;
    final fontSize = baseFontSize ?? effectiveStyle.fontSize ?? 14.0;
    
    final adjustedStyle = adaptive
        ? effectiveStyle.copyWith(
            fontSize: ResponsiveHelper.adaptiveFontSize(context, base: fontSize),
          )
        : effectiveStyle;

    final textWidget = Text(
      text,
      style: adjustedStyle,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );

    // If tooltip is provided or text might be truncated, wrap in tooltip
    if (tooltip != null || (maxLines != null && text.length > 50)) {
      return Tooltip(
        message: tooltip ?? text,
        child: textWidget,
      );
    }

    return textWidget;
  }
}

/// A specialized widget for food names that handles long text gracefully
class FoodNameText extends StatelessWidget {
  final String foodName;
  final TextStyle? style;
  final bool showTooltip;

  const FoodNameText(
    this.foodName, {
    super.key,
    this.style,
    this.showTooltip = true,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.titleMedium;
    final effectiveStyle = style ?? defaultStyle;
    
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(text: foodName, style: effectiveStyle),
          maxLines: 1,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final isOverflowing = textPainter.didExceedMaxLines;
        
        return ResponsiveText(
          foodName,
          style: effectiveStyle,
          maxLines: ResponsiveHelper.shouldUseCompactLayout(context) ? 2 : 1,
          tooltip: showTooltip && isOverflowing ? foodName : null,
        );
      },
    );
  }
}

/// Widget for displaying measurement amounts that adapts to screen size
class MeasurementAmountText extends StatelessWidget {
  final double amount;
  final String unit;
  final TextStyle? amountStyle;
  final TextStyle? unitStyle;

  const MeasurementAmountText({
    super.key,
    required this.amount,
    required this.unit,
    this.amountStyle,
    this.unitStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCompact = ResponsiveHelper.shouldUseCompactLayout(context);
    
    final defaultAmountStyle = theme.textTheme.headlineMedium?.copyWith(
      fontWeight: FontWeight.bold,
    );
    final defaultUnitStyle = theme.textTheme.bodyLarge?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );

    if (isCompact) {
      // Stack vertically on small screens
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ResponsiveText(
            _formatAmount(amount),
            style: amountStyle ?? defaultAmountStyle,
            baseFontSize: 20,
          ),
          ResponsiveText(
            unit,
            style: unitStyle ?? defaultUnitStyle,
            baseFontSize: 12,
          ),
        ],
      );
    }

    // Side by side on larger screens
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: _formatAmount(amount),
            style: (amountStyle ?? defaultAmountStyle)?.copyWith(
              fontSize: ResponsiveHelper.adaptiveFontSize(context, base: 20),
            ),
          ),
          TextSpan(
            text: ' $unit',
            style: (unitStyle ?? defaultUnitStyle)?.copyWith(
              fontSize: ResponsiveHelper.adaptiveFontSize(context, base: 14),
            ),
          ),
        ],
      ),
    );
  }

  String _formatAmount(double amount) {
    if (amount == amount.toInt()) {
      return amount.toInt().toString();
    }
    return amount.toStringAsFixed(1);
  }
}

/// Card title text that truncates gracefully
class CardTitleText extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color? iconColor;

  const CardTitleText({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCompact = ResponsiveHelper.shouldUseCompactLayout(context);

    return Row(
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            size: ResponsiveHelper.adaptiveFontSize(context, base: 20),
            color: iconColor ?? theme.colorScheme.primary,
          ),
          SizedBox(width: isCompact ? 8 : 12),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResponsiveText(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 2),
                ResponsiveText(
                  subtitle!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 2,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

/// Expandable text widget for long descriptions
class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLines;
  final TextStyle? style;

  const ExpandableText(
    this.text, {
    super.key,
    this.trimLines = 3,
    this.style,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultStyle = widget.style ?? theme.textTheme.bodyMedium;

    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(text: widget.text, style: defaultStyle),
          maxLines: widget.trimLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final isTextLong = textPainter.didExceedMaxLines;

        if (!isTextLong) {
          return ResponsiveText(widget.text, style: defaultStyle);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResponsiveText(
              widget.text,
              style: defaultStyle,
              maxLines: _isExpanded ? null : widget.trimLines,
            ),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () => setState(() => _isExpanded = !_isExpanded),
              child: Text(
                _isExpanded ? 'Show less' : 'Show more',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}