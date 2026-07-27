// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the global singleton [Isar] database instance for local storage operations.
///
/// This provider must be overridden in `main.dart` with an initialized [Isar] database instance
/// inside the root `ProviderScope` before any data operations are attempted.
///
/// Takes a [ref] to interact with the Riverpod framework dependency tree.
/// Returns the initialized [Isar] instance.
///
/// Throws [UnimplementedError] if read before being overridden during application startup.

@ProviderFor(isar)
final isarProvider = IsarProvider._();

/// Provides the global singleton [Isar] database instance for local storage operations.
///
/// This provider must be overridden in `main.dart` with an initialized [Isar] database instance
/// inside the root `ProviderScope` before any data operations are attempted.
///
/// Takes a [ref] to interact with the Riverpod framework dependency tree.
/// Returns the initialized [Isar] instance.
///
/// Throws [UnimplementedError] if read before being overridden during application startup.

final class IsarProvider extends $FunctionalProvider<Isar, Isar, Isar>
    with $Provider<Isar> {
  /// Provides the global singleton [Isar] database instance for local storage operations.
  ///
  /// This provider must be overridden in `main.dart` with an initialized [Isar] database instance
  /// inside the root `ProviderScope` before any data operations are attempted.
  ///
  /// Takes a [ref] to interact with the Riverpod framework dependency tree.
  /// Returns the initialized [Isar] instance.
  ///
  /// Throws [UnimplementedError] if read before being overridden during application startup.
  IsarProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isarProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isarHash();

  @$internal
  @override
  $ProviderElement<Isar> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Isar create(Ref ref) {
    return isar(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Isar value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Isar>(value),
    );
  }
}

String _$isarHash() => r'4bebb3882f4ac1de1463a04b35c78d42f72f4031';
