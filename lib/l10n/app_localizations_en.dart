// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Todo Flow';

  @override
  String get initializationFailed => 'Initialization Failed';

  @override
  String get tryAgain => 'Try again';

  @override
  String pageNotFound(String uri) {
    return 'Page not found: $uri';
  }

  @override
  String get settingsTitle => 'Settings';

  @override
  String get failedToLoadSettings => 'Failed to load settings';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark Mode';

  @override
  String get notifications => 'Notifications';

  @override
  String get failedToUpdatePreferences => 'Failed to update preferences';

  @override
  String get failedToUpdateThemeMode => 'Failed to update theme mode';

  @override
  String get settingsTooltip => 'Settings';

  @override
  String get failedToLoadTasks => 'Failed to load tasks';

  @override
  String get noTasksFound => 'No tasks found';

  @override
  String get addFirstTaskDescription =>
      'Add your first task using the button below';

  @override
  String get failedToToggleTask => 'Failed to toggle task';

  @override
  String get failedToDeleteTask => 'Failed to delete task';

  @override
  String get taskDeleted => 'Task deleted';

  @override
  String get failedToAddTask => 'Failed to add task';

  @override
  String get taskDetailsTitle => 'Task Details';

  @override
  String get genericError => 'An error occurred';

  @override
  String get taskNotFound => 'Task not found.';

  @override
  String get statusLabel => 'Status';

  @override
  String get statusCompleted => 'Completed';

  @override
  String get statusInProgress => 'In progress';

  @override
  String get createdAtLabel => 'Created at';

  @override
  String get addTaskButton => 'Add Task';

  @override
  String get newTaskDialogTitle => 'New Task';

  @override
  String get taskTitleLabel => 'Title';

  @override
  String get taskTitleHint => 'E.g. Buy milk';

  @override
  String get titleCannotBeEmpty => 'Title cannot be empty';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get addButton => 'Add';

  @override
  String markAsNotDone(String title) {
    return 'Mark \"$title\" as not done';
  }

  @override
  String markAsDone(String title) {
    return 'Mark \"$title\" as done';
  }
}
