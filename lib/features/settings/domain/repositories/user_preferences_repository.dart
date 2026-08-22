import '../../../../core/errors/failure.dart';
import '../../../../core/errors/result.dart';
import '../entities/user_preferences.dart';

/// Repository interface defining domain operations for user preferences.
///
/// Provides abstract data access methods for watching and modifying application settings,
/// isolating domain logic from the underlying storage mechanism.
abstract class UserPreferencesRepository {
  /// Watches user preferences for changes.
  ///
  /// Emits a continuous [Stream] containing updated [UserPreferences] whenever settings
  /// in the underlying persistence store are modified.
  Stream<UserPreferences> watch();

  /// Gets the current snapshot of user preferences.
  ///
  /// Returns a [Future] completing with the active [UserPreferences].
  Future<UserPreferences> get();

  /// Updates the theme mode setting to [themeMode].
  ///
  /// Returns a [Future] completing with a [CommandResult] indicating whether the update
  /// succeeded or returning a [Failure] on error.
  Future<CommandResult> updateThemeMode(UserThemeMode themeMode);

  /// Updates whether notifications are enabled to [isEnabled].
  ///
  /// Returns a [Future] completing with a [CommandResult] indicating whether the update
  /// succeeded or returning a [Failure] on error.
  Future<CommandResult> updateNotificationsEnabled(bool isEnabled);
}
