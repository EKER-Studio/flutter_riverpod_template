// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Global Riverpod provider configuring the application [GoRouter] instance.
///
/// Takes a Riverpod [ref] to access global state providers.
/// Returns a configured [GoRouter] with declarative routes, path parameters,
/// and error handling.

@ProviderFor(appRouter)
final appRouterProvider = AppRouterProvider._();

/// Global Riverpod provider configuring the application [GoRouter] instance.
///
/// Takes a Riverpod [ref] to access global state providers.
/// Returns a configured [GoRouter] with declarative routes, path parameters,
/// and error handling.

final class AppRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// Global Riverpod provider configuring the application [GoRouter] instance.
  ///
  /// Takes a Riverpod [ref] to access global state providers.
  /// Returns a configured [GoRouter] with declarative routes, path parameters,
  /// and error handling.
  AppRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRouterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return appRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$appRouterHash() => r'2246692bbadc876b58392680e791a637e582d21e';
