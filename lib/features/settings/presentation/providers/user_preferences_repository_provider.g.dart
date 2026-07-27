// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides a persistent singleton instance of [UserPreferencesRepository] backed by Isar.
///
/// Takes a [ref] to read the global [isarProvider] dependency.
/// Returns the concrete [UserPreferencesRepositoryImpl] implementation for preferences storage operations.

@ProviderFor(userPreferencesRepository)
final userPreferencesRepositoryProvider = UserPreferencesRepositoryProvider._();

/// Provides a persistent singleton instance of [UserPreferencesRepository] backed by Isar.
///
/// Takes a [ref] to read the global [isarProvider] dependency.
/// Returns the concrete [UserPreferencesRepositoryImpl] implementation for preferences storage operations.

final class UserPreferencesRepositoryProvider
    extends
        $FunctionalProvider<
          UserPreferencesRepository,
          UserPreferencesRepository,
          UserPreferencesRepository
        >
    with $Provider<UserPreferencesRepository> {
  /// Provides a persistent singleton instance of [UserPreferencesRepository] backed by Isar.
  ///
  /// Takes a [ref] to read the global [isarProvider] dependency.
  /// Returns the concrete [UserPreferencesRepositoryImpl] implementation for preferences storage operations.
  UserPreferencesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userPreferencesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userPreferencesRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserPreferencesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserPreferencesRepository create(Ref ref) {
    return userPreferencesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserPreferencesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserPreferencesRepository>(value),
    );
  }
}

String _$userPreferencesRepositoryHash() =>
    r'31d1fe8f690b4eab93a9802ac0abd96c88a015a8';
