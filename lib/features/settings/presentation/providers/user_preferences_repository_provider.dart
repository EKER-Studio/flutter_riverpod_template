import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/providers/isar_provider.dart';
import '../../data/repositories/user_preferences_repository_impl.dart';
import '../../domain/repositories/user_preferences_repository.dart';

part 'user_preferences_repository_provider.g.dart';

/// Provides a persistent singleton instance of [UserPreferencesRepository] backed by Isar.
///
/// Takes a [ref] to read the global [isarProvider] dependency.
/// Returns the concrete [UserPreferencesRepositoryImpl] implementation for preferences storage operations.
@Riverpod(keepAlive: true)
UserPreferencesRepository userPreferencesRepository(Ref ref) {
  return UserPreferencesRepositoryImpl(ref.watch(isarProvider));
}
