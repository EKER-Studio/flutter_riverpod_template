/// Domain failure hierarchy for modeling domain and data layer error states.
///
/// Provides abstract and concrete failure representations that decouple UI and business
/// logic from technical database, network, or framework-specific exception details.
sealed class Failure {
  /// Abstract constructor for [Failure] taking a descriptive [message].
  const Failure(this.message);

  /// A human-readable description of the failure for logging and diagnostic purposes.
  final String message;
}

/// Failure originating from a local database or persistence operation.
class DatabaseFailure extends Failure {
  /// Creates a [DatabaseFailure] with the given error [message].
  const DatabaseFailure(super.message);
}

/// Failure originating from a remote network or API communication operation.
class NetworkFailure extends Failure {
  /// Creates a [NetworkFailure] with the given error [message].
  const NetworkFailure(super.message);
}

/// Failure indicating that a requested domain resource or entity was not found.
class NotFoundFailure extends Failure {
  /// Creates a [NotFoundFailure] with the given error [message].
  const NotFoundFailure(super.message);
}

/// Failure occurring when domain rules or user input validation checks fail.
class ValidationFailure extends Failure {
  /// Creates a [ValidationFailure] with the given validation error [message].
  const ValidationFailure(super.message);
}

/// Catch-all failure representation for unclassified or unexpected error states.
class UnknownFailure extends Failure {
  /// Creates an [UnknownFailure] with the given error [message].
  const UnknownFailure(super.message);
}

/// Extension mapping domain [Failure] instances to localized or user-safe strings.
///
/// Hides raw exception details stored in [Failure.message] behind stable, user-friendly
/// strings, with the exception of [ValidationFailure] whose messages are explicitly user-facing.
extension FailureUserMessage on Failure {
  /// A human-readable error message formatted for safe UI presentation.
  String get userMessage => switch (this) {
    ValidationFailure(:final message) => message,
    NotFoundFailure() => 'This item no longer exists.',
    DatabaseFailure() =>
      'Something went wrong while saving your data. Please try again.',
    NetworkFailure() =>
      'Network error. Please check your connection and try again.',
    UnknownFailure() => 'Something went wrong. Please try again.',
  };
}
