import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/presentation/widgets/app_startup_widget.dart';

/// Main entrypoint function for the application.
///
/// Initializes Flutter bindings, sets up global error handling hooks via [runZonedGuarded],
/// and launches [AppStartupWidget] inside the root [ProviderScope] to coordinate service initialization.
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

      runApp(
        ProviderScope(
          child: AppStartupWidget(onLoaded: (context) => const App()),
        ),
      );
    },
    (Object error, StackTrace stack) {
      debugPrint('Uncaught async error: $error\n$stack');
    },
  );
}
