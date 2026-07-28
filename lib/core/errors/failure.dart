/// Domain failure hierarchy for modeling domain and data layer error states.
///
/// Provides abstract and concrete failure representations that decouple UI and business
/// logic from technical database or framework-specific exception details.
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

/// Extension mapping domain [Failure] instances to localized or user-safe strings.
extension FailureUserMessage on Failure {
  /// A human-readable error message formatted for safe UI presentation.
  String get userMessage => message;
}
