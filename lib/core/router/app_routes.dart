/// Defines all application navigation routes, paths, and names for GoRouter.
enum AppRoute {
  /// Main todos overview screen route.
  todos('/', 'todos'),

  /// Todo details screen route with dynamic id parameter.
  todoDetail('todos/:id', 'todo_detail'),

  /// User preferences and settings screen route.
  settings('/settings', 'settings');

  const AppRoute(this.path, this.name);

  /// The URL path template for the route.
  final String path;

  /// The unique identifier name for named navigation.
  final String name;
}
