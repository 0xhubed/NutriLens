import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/theme/app_theme.dart';
import 'analytics/analytics_screen.dart';
import 'camera/camera_screen.dart';
import 'history/history_screen.dart';
import 'home/home_screen.dart';
import 'settings/provider_settings_screen.dart';
import 'templates/template_library_screen.dart';
import 'templates/template_selection_screen.dart';
import 'text_entry/text_food_entry_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/camera',
        name: 'camera',
        builder: (context, state) => const CameraScreen(),
      ),
      GoRoute(
        path: '/history',
        name: 'history',
        builder: (context, state) => const HistoryScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const ProviderSettingsScreen(),
      ),
      GoRoute(
        path: '/templates',
        name: 'templates',
        builder: (context, state) => const TemplateLibraryScreen(),
      ),
      GoRoute(
        path: '/analytics',
        name: 'analytics',
        builder: (context, state) => const AnalyticsScreen(),
      ),
      GoRoute(
        path: '/text-entry',
        name: 'textEntry',
        builder: (context, state) => const TextFoodEntryScreen(),
      ),
      GoRoute(
        path: '/templates/select',
        name: 'templateSelect',
        builder: (context, state) => const TemplateSelectionScreen(),
      ),
    ],
  );
});

class NutriLensApp extends ConsumerWidget {
  const NutriLensApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    
    return MaterialApp.router(
      title: 'NutriLens',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}