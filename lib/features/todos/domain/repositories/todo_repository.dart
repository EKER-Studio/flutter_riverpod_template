import '../../../../core/errors/failure.dart';
import '../entities/todo.dart';

/// Repository interface defining domain operations for todo items.
///
/// Serves as the abstraction contract for todo persistence and reactive queries,
/// isolating domain and presentation logic from concrete data sources.
abstract class TodoRepository {
  /// Watches all todo items.
  ///
  /// Emits a continuous [Stream] emitting the complete list of [Todo] entities
  /// whenever any todo in the underlying persistence layer changes.
  Stream<List<Todo>> watchAll();

  /// Watches a specific todo item by its [id].
  ///
  /// Emits a continuous [Stream] emitting the matching [Todo] entity (or `null`
  /// if deleted or not found) whenever the entity matching [id] changes.
  Stream<Todo?> watchById(int id);

  /// Gets all todo items as a one-shot snapshot.
  ///
  /// Returns a [Future] completing with a [List] of all current [Todo] entities.
  ///
  /// Not currently called by any notifier — [watchAll] is used instead for
  /// reactive updates. Kept on the interface for one-shot use cases such as
  /// CSV/JSON export or pagination cursors, where a live stream isn't
  /// needed.
  Future<List<Todo>> getAll();

  /// Adds a new todo item with the given [title].
  ///
  /// Returns a [Future] completing with a tuple `(bool success, Failure? failure)`
  /// indicating whether creation succeeded or returning a [Failure] on error.
  Future<(bool success, Failure? failure)> add({required String title});

  /// Toggles the completion status of a todo item identified by [id].
  ///
  /// Returns a [Future] completing with a tuple `(bool success, Failure? failure)`
  /// indicating whether the operation succeeded or returning a [Failure] on error.
  Future<(bool success, Failure? failure)> toggleCompleted({required int id});

  /// Deletes a todo item identified by [id].
  ///
  /// Returns a [Future] completing with a tuple `(bool success, Failure? failure)`
  /// indicating whether deletion succeeded or returning a [Failure] on error.
  Future<(bool success, Failure? failure)> delete({required int id});
}
