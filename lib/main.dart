import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'core/providers/isar_provider.dart';
import 'features/settings/data/models/user_preferences_model.dart';
import 'features/todos/data/models/todo_model.dart';

/// Main entrypoint function for the application.
///
/// Initializes Flutter bindings, sets up global error handling hooks via [runZonedGuarded],
/// initializes the local [Isar] database, overrides [isarProvider], and launches [App].
///
/// Returns a [Future] completing when initial setup is finished.
Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.presentError(details);
        debugPrint('Uncaught Flutter error: ${details.exceptionAsString()}');
      };

      final directory = await getApplicationDocumentsDirectory();
      final isar =
          Isar.getInstance() ??
          await Isar.open([
            TodoModelSchema,
            UserPreferencesModelSchema,
          ], directory: directory.path);

      runApp(
        ProviderScope(
          overrides: [isarProvider.overrideWithValue(isar)],
          child: const App(),
        ),
      );
    },
    (Object error, StackTrace stack) {
      debugPrint('Uncaught async error: $error\n$stack');
    },
  );
}
