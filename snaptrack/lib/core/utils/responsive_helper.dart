import 'package:flutter/material.dart';

/// Helper class for responsive design across different screen sizes
class ResponsiveHelper {
  // Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1200;
  
  /// Check if current device is mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }
  
  /// Check if current device is tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }
  
  /// Check if current device is desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }
  
  /// Get adaptive padding based on screen size
  static double adaptivePadding(BuildContext context) {
    if (isMobile(context)) return 16.0;
    if (isTablet(context)) return 24.0;
    return 32.0;
  }
  
  /// Get adaptive spacing based on screen size
  static double adaptiveSpacing(BuildContext context, {required double base}) {
    if (isMobile(context)) return base * 0.8;
    if (isTablet(context)) return base;
    return base * 1.2;
  }
  
  /// Get adaptive font size
  static double adaptiveFontSize(BuildContext context, {required double base}) {
    final width = MediaQuery.of(context).size.width;
    
    // Scale font size based on screen width
    if (width < 360) return base * 0.85; // Very small phones
    if (width < 400) return base * 0.9;  // Small phones
    if (width < 600) return base;        // Normal phones
    if (width < 900) return base * 1.1;  // Tablets
    if (width < 1200) return base * 1.15; // Large tablets
    return base * 1.2;                    // Desktop
  }
  
  /// Get number of grid columns based on screen size
  static int getGridColumns(BuildContext context, {int baseColumns = 2}) {
    if (isMobile(context)) return baseColumns;
    if (isTablet(context)) return baseColumns + 1;
    return baseColumns + 2;
  }
  
  /// Get adaptive app bar height
  static double getAppBarHeight(BuildContext context) {
    if (isMobile(context)) return 100.0;
    if (isTablet(context)) return 120.0;
    return 140.0;
  }
  
  /// Check if we should show compact layout
  static bool shouldUseCompactLayout(BuildContext context) {
    return MediaQuery.of(context).size.width < 400;
  }
  
  /// Get max content width for centered layouts
  static double getMaxContentWidth(BuildContext context) {
    if (isMobile(context)) return double.infinity;
    if (isTablet(context)) return 800.0;
    return 1200.0;
  }
  
  /// Calculate responsive flex values for Row/Column widgets
  static int getFlexValue(BuildContext context, {required int base}) {
    if (shouldUseCompactLayout(context)) return 1;
    return base;
  }
  
  /// Get orientation-aware value
  static T orientationValue<T>(
    BuildContext context, {
    required T portrait,
    required T landscape,
  }) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? portrait
        : landscape;
  }
  
  /// Check if keyboard is visible
  static bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }
  
  /// Get safe area padding
  static EdgeInsets getSafeAreaPadding(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return EdgeInsets.only(
      left: mediaQuery.padding.left + adaptivePadding(context),
      right: mediaQuery.padding.right + adaptivePadding(context),
      top: mediaQuery.padding.top,
      bottom: mediaQuery.padding.bottom,
    );
  }
  
  /// Build responsive container with max width constraints
  static Widget buildResponsiveContainer({
    required BuildContext context,
    required Widget child,
    EdgeInsets? padding,
    double? maxWidth,
  }) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? getMaxContentWidth(context),
        ),
        padding: padding ?? EdgeInsets.all(adaptivePadding(context)),
        child: child,
      ),
    );
  }
}

/// Extension for responsive text
extension ResponsiveText on Text {
  Widget responsive(BuildContext context) {
    final style = this.style ?? const TextStyle();
    final baseSize = style.fontSize ?? 14.0;
    
    return Text(
      data ?? '',
      key: key,
      style: style.copyWith(
        fontSize: ResponsiveHelper.adaptiveFontSize(
          context,
          base: baseSize,
        ),
      ),
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow ?? TextOverflow.ellipsis,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }
}