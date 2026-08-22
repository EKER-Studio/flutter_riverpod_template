import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/result.dart';
import '../../domain/entities/user_preferences.dart';
import 'user_preferences_repository_provider.dart';

part 'user_preferences_notifier.g.dart';

/// Riverpod state notifier managing the application's user preferences state.
///
/// Watches [UserPreferencesRepository.watch] for live settings changes and provides
/// methods to update theme modes and notification flags.
@riverpod
class UserPreferencesNotifier extends _$UserPreferencesNotifier {
  /// Initializes the notifier by watching user preferences from [userPreferencesRepositoryProvider].
  ///
  /// Returns a continuous [Stream] emitting updated [UserPreferences] entities whenever settings change.
  @override
  Stream<UserPreferences> build() {
    final repository = ref.watch(userPreferencesRepositoryProvider);
    return repository.watch();
  }

  /// Updates the application theme mode to [themeMode].
  ///
  /// Returns a [Future] completing with a [CommandResult] indicating whether the theme update succeeded.
  Future<CommandResult> updateThemeMode(UserThemeMode themeMode) async {
    return await ref
        .read(userPreferencesRepositoryProvider)
        .updateThemeMode(themeMode);
  }

  /// Updates the user's notification preference flag to [isEnabled].
  ///
  /// Returns a [Future] completing with a [CommandResult] indicating whether the preference update succeeded.
  Future<CommandResult> updateNotificationsEnabled(bool isEnabled) async {
    return await ref
        .read(userPreferencesRepositoryProvider)
        .updateNotificationsEnabled(isEnabled);
  }
}
