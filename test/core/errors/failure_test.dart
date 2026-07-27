import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod_boilerplate/core/errors/failure.dart';

void main() {
  group('Failure classes', () {
    test('DatabaseFailure holds message correctly', () {
      const failure = DatabaseFailure('DB error');
      expect(failure.message, 'DB error');
    });

    test('NetworkFailure holds message correctly', () {
      const failure = NetworkFailure('Network error');
      expect(failure.message, 'Network error');
    });

    test('NotFoundFailure holds message correctly', () {
      const failure = NotFoundFailure('Not found');
      expect(failure.message, 'Not found');
    });

    test('ValidationFailure holds message correctly', () {
      const failure = ValidationFailure('Validation error');
      expect(failure.message, 'Validation error');
    });

    test('UnknownFailure holds message correctly', () {
      const failure = UnknownFailure('Unknown error');
      expect(failure.message, 'Unknown error');
    });
  });

  group('FailureUserMessage extension', () {
    test('ValidationFailure returns raw message as userMessage', () {
      const failure = ValidationFailure('Invalid input format');
      expect(failure.userMessage, 'Invalid input format');
    });

    test('NotFoundFailure returns stable user-friendly message', () {
      const failure = NotFoundFailure('Specific raw id failure');
      expect(failure.userMessage, 'This item no longer exists.');
    });

    test('DatabaseFailure returns stable user-friendly message', () {
      const failure = DatabaseFailure('Isar unique constraint violated');
      expect(
        failure.userMessage,
        'Something went wrong while saving your data. Please try again.',
      );
    });

    test('NetworkFailure returns stable user-friendly message', () {
      const failure = NetworkFailure('SocketException: Connection refused');
      expect(
        failure.userMessage,
        'Network error. Please check your connection and try again.',
      );
    });

    test('UnknownFailure returns stable user-friendly message', () {
      const failure = UnknownFailure('StackOverflowError');
      expect(failure.userMessage, 'Something went wrong. Please try again.');
    });
  });
}
