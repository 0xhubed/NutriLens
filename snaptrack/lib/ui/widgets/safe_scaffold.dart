import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A scaffold wrapper that properly handles system insets, IME, and safe areas
/// for edge-to-edge display while ensuring content remains accessible.
class SafeScaffold extends StatelessWidget {
  final Widget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final PreferredSizeWidget? customAppBar;

  const SafeScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.customAppBar,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _getSystemUiOverlayStyle(context),
      child: Scaffold(
        appBar: customAppBar ?? (appBar != null ? _buildSafeAppBar(context) : null),
        body: SafeArea(
          top: customAppBar == null && appBar == null,
          bottom: bottomNavigationBar == null,
          child: body,
        ),
        bottomNavigationBar: bottomNavigationBar != null
            ? SafeArea(
                top: false,
                child: bottomNavigationBar!,
              )
            : null,
        floatingActionButton: floatingActionButton != null
            ? SafeArea(
                top: false,
                child: floatingActionButton!,
              )
            : null,
        floatingActionButtonLocation: floatingActionButtonLocation,
        drawer: drawer,
        endDrawer: endDrawer,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
      ),
    );
  }

  PreferredSizeWidget? _buildSafeAppBar(BuildContext context) {
    if (appBar == null) return null;
    
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + MediaQuery.of(context).padding.top),
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: appBar,
      ),
    );
  }

  SystemUiOverlayStyle _getSystemUiOverlayStyle(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    );
  }
}

/// A widget that provides safe area padding for content that needs to avoid
/// system UI overlaps while supporting both IME and system bars.
class SafeAreaWrapper extends StatelessWidget {
  final Widget child;
  final bool top;
  final bool bottom;
  final bool left;
  final bool right;
  final bool maintainBottomViewPadding;
  final EdgeInsets minimum;

  const SafeAreaWrapper({
    super.key,
    required this.child,
    this.top = true,
    this.bottom = true,
    this.left = true,
    this.right = true,
    this.maintainBottomViewPadding = false,
    this.minimum = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      maintainBottomViewPadding: maintainBottomViewPadding,
      minimum: minimum,
      child: child,
    );
  }
}

/// A specialized wrapper for handling IME (keyboard) overlaps
/// Automatically adjusts content when keyboard appears/disappears
class IMEAwareWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final bool resizeToAvoidBottomInset;

  const IMEAwareWrapper({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    this.resizeToAvoidBottomInset = true,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final keyboardHeight = mediaQuery.viewInsets.bottom;
    final bottomPadding = resizeToAvoidBottomInset 
        ? mediaQuery.padding.bottom + keyboardHeight
        : mediaQuery.padding.bottom;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      padding: EdgeInsets.only(
        left: padding.left + mediaQuery.padding.left,
        top: padding.top,
        right: padding.right + mediaQuery.padding.right,
        bottom: padding.bottom + bottomPadding,
      ),
      child: child,
    );
  }
}

/// A specialized scaffold for screens with forms and text input
/// that need proper keyboard handling
class FormSafeScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final EdgeInsets bodyPadding;
  final bool extendBodyBehindAppBar;

  const FormSafeScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bodyPadding = const EdgeInsets.all(16.0),
    this.extendBodyBehindAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      customAppBar: appBar,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: IMEAwareWrapper(
        padding: bodyPadding,
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      resizeToAvoidBottomInset: true,
    );
  }
}