// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Lista Zadań';

  @override
  String get initializationFailed => 'Inicjalizacja nie powiodła się';

  @override
  String get tryAgain => 'Spróbuj ponownie';

  @override
  String pageNotFound(String uri) {
    return 'Nie znaleziono strony: $uri';
  }

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get failedToLoadSettings => 'Nie udało się załadować ustawień';

  @override
  String get themeSystem => 'Systemowy';

  @override
  String get themeLight => 'Jasny';

  @override
  String get themeDark => 'Ciemny';

  @override
  String get notifications => 'Powiadomienia';

  @override
  String get failedToUpdatePreferences =>
      'Nie udało się zaktualizować preferencji';

  @override
  String get failedToUpdateThemeMode => 'Nie udało się zmienić motywu';

  @override
  String get settingsTooltip => 'Ustawienia';

  @override
  String get failedToLoadTasks => 'Nie udało się załadować zadań';

  @override
  String get noTasksFound => 'Brak zadań';

  @override
  String get addFirstTaskDescription =>
      'Dodaj swoje pierwsze zadanie za pomocą poniższego przycisku';

  @override
  String get failedToToggleTask => 'Nie udało się zmienić stanu zadania';

  @override
  String get failedToDeleteTask => 'Nie udało się usunąć zadania';

  @override
  String get taskDeleted => 'Zadanie usunięte';

  @override
  String get failedToAddTask => 'Nie udało się dodać zadania';

  @override
  String get taskDetailsTitle => 'Szczegóły zadania';

  @override
  String get genericError => 'Wystąpił błąd';

  @override
  String get taskNotFound => 'Nie znaleziono zadania.';

  @override
  String get statusLabel => 'Status';

  @override
  String get statusCompleted => 'Ukończone';

  @override
  String get statusInProgress => 'W toku';

  @override
  String get createdAtLabel => 'Utworzono';

  @override
  String get addTaskButton => 'Dodaj zadanie';

  @override
  String get newTaskDialogTitle => 'Nowe zadanie';

  @override
  String get taskTitleLabel => 'Tytuł';

  @override
  String get taskTitleHint => 'Np. Kupić mleko';

  @override
  String get titleCannotBeEmpty => 'Tytuł nie może być pusty';

  @override
  String get cancelButton => 'Anuluj';

  @override
  String get addButton => 'Dodaj';

  @override
  String markAsNotDone(String title) {
    return 'Oznacz „$title” jako niewykonane';
  }

  @override
  String markAsDone(String title) {
    return 'Oznacz „$title” jako wykonane';
  }
}
