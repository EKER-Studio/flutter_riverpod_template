import 'package:isar_community/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isar_provider.g.dart';

/// Provides the global singleton [Isar] database instance for local storage operations.
///
/// This provider must be overridden in `main.dart` with an initialized [Isar] database instance
/// inside the root `ProviderScope` before any data operations are attempted.
///
/// Takes a [ref] to interact with the Riverpod framework dependency tree.
/// Returns the initialized [Isar] instance.
///
/// Throws [UnimplementedError] if read before being overridden during application startup.
@Riverpod(keepAlive: true)
Isar isar(Ref ref) {
  throw UnimplementedError('isarProvider must be overridden in main.dart');
}
