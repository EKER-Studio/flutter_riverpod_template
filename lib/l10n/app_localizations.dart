import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl'),
  ];

  /// The title of the application displayed in the top appBar
  ///
  /// In en, this message translates to:
  /// **'Todo Flow'**
  String get appTitle;

  /// Header text displayed when startup initialization fails
  ///
  /// In en, this message translates to:
  /// **'Initialization Failed'**
  String get initializationFailed;

  /// Button label to retry a failed operation
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// Error message displayed for unrecognized routes
  ///
  /// In en, this message translates to:
  /// **'Page not found: {uri}'**
  String pageNotFound(String uri);

  /// Title displayed on the settings screen app bar
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Error message when settings cannot be retrieved
  ///
  /// In en, this message translates to:
  /// **'Failed to load settings'**
  String get failedToLoadSettings;

  /// Label for system default theme option
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// Label for light theme option
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// Label for dark theme option
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get themeDark;

  /// Label for notifications toggle switch
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Snackbar message when updating notification preference fails
  ///
  /// In en, this message translates to:
  /// **'Failed to update preferences'**
  String get failedToUpdatePreferences;

  /// Snackbar message when updating theme mode fails
  ///
  /// In en, this message translates to:
  /// **'Failed to update theme mode'**
  String get failedToUpdateThemeMode;

  /// Accessibility tooltip for settings button in app bar
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTooltip;

  /// Error message when task list cannot be loaded
  ///
  /// In en, this message translates to:
  /// **'Failed to load tasks'**
  String get failedToLoadTasks;

  /// Header message displayed when the task list is empty
  ///
  /// In en, this message translates to:
  /// **'No tasks found'**
  String get noTasksFound;

  /// Subtext prompting user to add their first task
  ///
  /// In en, this message translates to:
  /// **'Add your first task using the button below'**
  String get addFirstTaskDescription;

  /// Snackbar message when task completion toggle fails
  ///
  /// In en, this message translates to:
  /// **'Failed to toggle task'**
  String get failedToToggleTask;

  /// Snackbar message when task deletion fails
  ///
  /// In en, this message translates to:
  /// **'Failed to delete task'**
  String get failedToDeleteTask;

  /// Snackbar confirmation message after a task is deleted
  ///
  /// In en, this message translates to:
  /// **'Task deleted'**
  String get taskDeleted;

  /// Snackbar message when creating a new task fails
  ///
  /// In en, this message translates to:
  /// **'Failed to add task'**
  String get failedToAddTask;

  /// Title displayed on the task details screen app bar
  ///
  /// In en, this message translates to:
  /// **'Task Details'**
  String get taskDetailsTitle;

  /// Generic error header message
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get genericError;

  /// Message displayed when the requested task does not exist
  ///
  /// In en, this message translates to:
  /// **'Task not found.'**
  String get taskNotFound;

  /// Label for task completion status field
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get statusLabel;

  /// Status value indicating a task is finished
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get statusCompleted;

  /// Status value indicating a task is not finished
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get statusInProgress;

  /// Label for task creation timestamp field
  ///
  /// In en, this message translates to:
  /// **'Created at'**
  String get createdAtLabel;

  /// Label for floating action button to create a task
  ///
  /// In en, this message translates to:
  /// **'Add Task'**
  String get addTaskButton;

  /// Title displayed on new task dialog
  ///
  /// In en, this message translates to:
  /// **'New Task'**
  String get newTaskDialogTitle;

  /// Input field label for task title
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get taskTitleLabel;

  /// Input field hint text for task title
  ///
  /// In en, this message translates to:
  /// **'E.g. Buy milk'**
  String get taskTitleHint;

  /// Validation error message when task title is empty
  ///
  /// In en, this message translates to:
  /// **'Title cannot be empty'**
  String get titleCannotBeEmpty;

  /// Button label to cancel dialog action
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// Button label to submit dialog action
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get addButton;

  /// Semantic accessibility label for unchecking a task
  ///
  /// In en, this message translates to:
  /// **'Mark \"{title}\" as not done'**
  String markAsNotDone(String title);

  /// Semantic accessibility label for checking a task
  ///
  /// In en, this message translates to:
  /// **'Mark \"{title}\" as done'**
  String markAsDone(String title);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pl':
      return AppLocalizationsPl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
