import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod_boilerplate/core/errors/failure.dart';

void main() {
  group('Failure classes', () {
    test('DatabaseFailure holds message correctly', () {
      const failure = DatabaseFailure('DB error');
      expect(failure.message, 'DB error');
    });
  });

  group('FailureUserMessage extension', () {
    test('DatabaseFailure returns message as userMessage', () {
      const failure = DatabaseFailure('Isar unique constraint violated');
      expect(failure.userMessage, 'Isar unique constraint violated');
    });
  });
}
