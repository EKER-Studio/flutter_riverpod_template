import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/user_preferences.dart';
import '../providers/user_preferences_notifier.dart';

/// Presentation widget rendering the user preferences and settings screen.
///
/// Displays theme mode selectors and notification switches, allowing users to modify
/// application settings backed by [userPreferencesProvider].
class SettingsScreen extends ConsumerWidget {
  /// Creates a settings screen widget instance.
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferencesAsync = ref.watch(userPreferencesProvider);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n?.settingsTitle ?? 'Settings')),
      body: preferencesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  l10n?.failedToLoadSettings ?? 'Failed to load settings',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  error is Failure ? error.userMessage : error.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => ref.invalidate(userPreferencesProvider),
                  child: Text(l10n?.tryAgain ?? 'Try again'),
                ),
              ],
            ),
          ),
        ),
        data: (preferences) => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          children: [
            SegmentedButton<UserThemeMode>(
              segments: [
                ButtonSegment<UserThemeMode>(
                  value: UserThemeMode.system,
                  icon: const Icon(Icons.brightness_auto_outlined),
                  label: Text(l10n?.themeSystem ?? 'System'),
                ),
                ButtonSegment<UserThemeMode>(
                  value: UserThemeMode.light,
                  icon: const Icon(Icons.light_mode_outlined),
                  label: Text(l10n?.themeLight ?? 'Light'),
                ),
                ButtonSegment<UserThemeMode>(
                  value: UserThemeMode.dark,
                  icon: const Icon(Icons.dark_mode_outlined),
                  label: Text(l10n?.themeDark ?? 'Dark Mode'),
                ),
              ],
              selected: {preferences.themeMode},
              onSelectionChanged: (selection) =>
                  _updateThemeMode(context, ref, selection.single),
            ),
            const Divider(height: 24),
            SwitchListTile(
              title: Text(l10n?.notifications ?? 'Notifications'),
              secondary: const Icon(Icons.notifications_outlined),
              value: preferences.isNotificationsEnabled,
              onChanged: (value) async {
                final (success, failure) = await ref
                    .read(userPreferencesProvider.notifier)
                    .updateNotificationsEnabled(value);
                if (!success && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        failure?.userMessage ??
                            (l10n?.failedToUpdatePreferences ??
                                'Failed to update preferences'),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateThemeMode(
    BuildContext context,
    WidgetRef ref,
    UserThemeMode value,
  ) async {
    final (success, failure) = await ref
        .read(userPreferencesProvider.notifier)
        .updateThemeMode(value);
    if (!success && context.mounted) {
      final l10n = AppLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            failure?.userMessage ??
                (l10n?.failedToUpdateThemeMode ??
                    'Failed to update theme mode'),
          ),
        ),
      );
    }
  }
}
