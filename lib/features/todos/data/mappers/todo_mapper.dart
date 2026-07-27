import '../../domain/entities/todo.dart';
import '../models/todo_model.dart';

/// Synchronous data mapping extensions for converting [TodoModel] data transfers to domain entities.
extension TodoModelMapper on TodoModel {
  /// Converts this persistent [TodoModel] instance into a clean domain [Todo] entity.
  ///
  /// Returns a new immutable [Todo] containing mapped values.
  Todo toEntity() {
    return Todo(
      id: id,
      title: title,
      isCompleted: isCompleted,
      createdAt: createdAt,
    );
  }
}

/// Synchronous data mapping extensions for converting domain [Todo] entities to persistent models.
extension TodoEntityMapper on Todo {
  /// Converts this domain [Todo] entity into an Isar-compatible [TodoModel] database object.
  ///
  /// Returns a new [TodoModel] populated with entity property values.
  TodoModel toModel() {
    return TodoModel()
      ..id = id
      ..title = title
      ..isCompleted = isCompleted
      ..createdAt = createdAt;
  }
}
