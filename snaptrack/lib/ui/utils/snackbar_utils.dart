import 'package:flutter/material.dart';

/// Utility class for showing properly positioned snackbars that respect
/// system insets and IME (keyboard) positioning.
class SnackbarUtils {
  /// Shows a success snackbar with proper positioning
  static void showSuccess(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 4),
  }) {
    _showSnackbar(
      context,
      message,
      backgroundColor: Colors.green,
      icon: Icons.check_circle,
      duration: duration,
    );
  }

  /// Shows an error snackbar with proper positioning
  static void showError(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 6),
  }) {
    _showSnackbar(
      context,
      message,
      backgroundColor: Colors.red,
      icon: Icons.error,
      duration: duration,
    );
  }

  /// Shows a warning snackbar with proper positioning
  static void showWarning(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 5),
  }) {
    _showSnackbar(
      context,
      message,
      backgroundColor: Colors.orange,
      icon: Icons.warning,
      duration: duration,
    );
  }

  /// Shows an info snackbar with proper positioning
  static void showInfo(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 4),
  }) {
    _showSnackbar(
      context,
      message,
      backgroundColor: Colors.blue,
      icon: Icons.info,
      duration: duration,
    );
  }

  /// Shows a custom snackbar with proper positioning
  static void showCustom(
    BuildContext context,
    Widget content, {
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
  }) {
    final mediaQuery = MediaQuery.of(context);
    final keyboardHeight = mediaQuery.viewInsets.bottom;
    final bottomPadding = mediaQuery.padding.bottom;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: content,
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        action: action,
        margin: EdgeInsets.only(
          bottom: keyboardHeight + bottomPadding + 16,
          left: 16,
          right: 16,
        ),
      ),
    );
  }

  /// Private helper method for consistent snackbar creation
  static void _showSnackbar(
    BuildContext context,
    String message, {
    required Color backgroundColor,
    required IconData icon,
    required Duration duration,
  }) {
    final mediaQuery = MediaQuery.of(context);
    final keyboardHeight = mediaQuery.viewInsets.bottom;
    final bottomPadding = mediaQuery.padding.bottom;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        margin: EdgeInsets.only(
          bottom: keyboardHeight + bottomPadding + 16,
          left: 16,
          right: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  /// Clears any currently displayed snackbar
  static void clearSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
  }
}

/// Extension on BuildContext for easier snackbar access
extension SnackbarExtension on BuildContext {
  /// Shows a success snackbar
  void showSuccessSnackbar(String message) {
    SnackbarUtils.showSuccess(this, message);
  }

  /// Shows an error snackbar
  void showErrorSnackbar(String message) {
    SnackbarUtils.showError(this, message);
  }

  /// Shows a warning snackbar
  void showWarningSnackbar(String message) {
    SnackbarUtils.showWarning(this, message);
  }

  /// Shows an info snackbar
  void showInfoSnackbar(String message) {
    SnackbarUtils.showInfo(this, message);
  }

  /// Clears any currently displayed snackbar
  void clearSnackbar() {
    SnackbarUtils.clearSnackbar(this);
  }
}