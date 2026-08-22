import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/todos/presentation/screens/todo_screen.dart';
import '../../features/todos/presentation/screens/todo_screen_detail.dart';
import 'app_routes.dart';

part 'app_router.g.dart';

/// Global Riverpod provider configuring the application [GoRouter] instance.
///
/// Takes a Riverpod [ref] to access global state providers.
/// Returns a configured [GoRouter] with declarative routes, path parameters,
/// and error handling.
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: AppRoute.todos.path,
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
        path: AppRoute.todos.path,
        name: AppRoute.todos.name,
        builder: (BuildContext context, GoRouterState state) =>
            const TodoScreen(),
        routes: [
          GoRoute(
            path: AppRoute.todoDetail.path,
            name: AppRoute.todoDetail.name,
            builder: (BuildContext context, GoRouterState state) {
              final idParam = state.pathParameters['id'];
              final todoId = int.tryParse(idParam ?? '') ?? 0;
              return TodoDetailScreen(todoId: todoId);
            },
          ),
        ],
      ),
      GoRoute(
        path: AppRoute.settings.path,
        name: AppRoute.settings.name,
        builder: (BuildContext context, GoRouterState state) =>
            const SettingsScreen(),
      ),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
