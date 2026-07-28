import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/todo.dart';
import 'todo_repository_provider.dart';

part 'todo_notifier.g.dart';

/// Riverpod state notifier managing the reactive stream of todo items.
///
/// Listens directly to [TodoRepository.watchAll] streams and exposes UI state actions
/// for creating, toggling, and deleting todo entities.
@riverpod
class TodoList extends _$TodoList {
  /// Initializes the notifier by watching all todo items from [todoRepositoryProvider].
  ///
  /// Returns a continuous [Stream] emitting lists of [Todo] entities whenever the storage changes.
  @override
  Stream<List<Todo>> build() {
    final repository = ref.watch(todoRepositoryProvider);
    return repository.watchAll();
  }

  /// Adds a new todo item with the given [title].
  ///
  /// Trims whitespace from [title] before calling the repository. Returns a [Future] completing
  /// with a tuple `(bool success, Failure? failure)` containing `(false, DatabaseFailure)`
  /// if [title] is empty or whitespace-only.
  Future<(bool success, Failure? failure)> addTodo(String title) async {
    final trimmedTitle = title.trim();
    if (trimmedTitle.isEmpty) {
      return (false, const DatabaseFailure('Title cannot be empty'));
    }
    return await ref.read(todoRepositoryProvider).add(title: trimmedTitle);
  }

  /// Toggles the completion status of a todo item identified by [id].
  ///
  /// Returns a [Future] completing with a tuple `(bool success, Failure? failure)`
  /// indicating whether the status update succeeded.
  Future<(bool success, Failure? failure)> toggleTodo(int id) async {
    return await ref.read(todoRepositoryProvider).toggleCompleted(id: id);
  }

  /// Deletes a todo item identified by [id].
  ///
  /// Returns a [Future] completing with a tuple `(bool success, Failure? failure)`
  /// indicating whether deletion succeeded.
  Future<(bool success, Failure? failure)> deleteTodo(int id) async {
    return await ref.read(todoRepositoryProvider).delete(id: id);
  }
}
