import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_boilerplate/l10n/app_localizations.dart';

import 'features/settings/domain/entities/user_preferences.dart';
import 'features/settings/presentation/providers/user_preferences_notifier.dart';
import 'features/todos/presentation/screens/todo_screen.dart';
import 'core/presentation/theme/app_theme.dart';

/// Root application widget configuring themes, navigation, and core Material3 setup.
///
/// Reactively subscribes to [userPreferencesProvider] to apply dark, light, or system
/// theme modes dynamically.
class App extends ConsumerWidget {
  /// Creates a new root [App] widget instance.
  const App({super.key});

  /// Builds the top-level [MaterialApp] with reactive theme configuration.
  ///
  /// Takes a build [context] and Riverpod widget [ref] to watch theme preferences.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(userPreferencesProvider).value;

    return MaterialApp(
      title: 'Flutter Blueprint',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _toFlutterThemeMode(
        preferences?.themeMode ?? UserThemeMode.system,
      ),
      home: const TodoScreen(),
    );
  }

  ThemeMode _toFlutterThemeMode(UserThemeMode themeMode) {
    return switch (themeMode) {
      UserThemeMode.light => ThemeMode.light,
      UserThemeMode.dark => ThemeMode.dark,
      UserThemeMode.system => ThemeMode.system,
    };
  }
}
