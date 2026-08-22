import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/settings/data/models/user_preferences_model.dart';
import '../../features/todos/data/models/todo_model.dart';

part 'isar_provider.g.dart';

/// Asynchronously initializes and provides the singleton [Isar] database instance.
///
/// Takes a [ref] to interact with the Riverpod framework dependency tree.
/// Returns a [Future] completing with the opened [Isar] database.
@Riverpod(keepAlive: true)
Future<Isar> isarDb(Ref ref) async {
  final directory = await getApplicationDocumentsDirectory();
  return Isar.getInstance() ??
      await Isar.open([
        TodoModelSchema,
        UserPreferencesModelSchema,
      ], directory: directory.path);
}

/// Provides the synchronous [Isar] database instance for repositories.
///
/// Pre-warmed during application startup by `appStartupProvider`.
/// Takes a [ref] to read the resolved [isarDbProvider] value.
/// Returns the initialized [Isar] database instance.
@Riverpod(keepAlive: true)
Isar isar(Ref ref) {
  return ref.watch(isarDbProvider).requireValue;
}
