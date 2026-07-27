import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/todo.dart';
import '../screens/todo_screen_detail.dart';

/// Reusable list tile component rendering a single todo item within a dismissible list.
///
/// Features interactive checkbox toggling, swipe-to-delete dismissal, and tap navigation
/// to the detail screen for the given [todo].
class TodoListItem extends StatelessWidget {
  /// Creates a [TodoListItem] widget for the given [todo] with [onToggle] and [onDelete] callbacks.
  const TodoListItem({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
  });

  /// The domain [Todo] entity represented by this list item.
  final Todo todo;

  /// Callback executed when the checkbox state is toggled by the user.
  final VoidCallback onToggle;

  /// Callback executed when the item is swiped away to be deleted.
  final VoidCallback onDelete;

  /// Builds the dismissible list tile widget.
  ///
  /// Takes the widget build [context].
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(todo.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Theme.of(context).colorScheme.error,
        child: Icon(
          Icons.delete_outline,
          color: Theme.of(context).colorScheme.onError,
        ),
      ),
      onDismissed: (_) => onDelete(),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TodoDetailScreen(todoId: todo.id),
            ),
          );
        },
        leading: Semantics(
          label: todo.isCompleted
              ? 'Mark "${todo.title}" as not done'
              : 'Mark "${todo.title}" as done',
          child: Checkbox(
            value: todo.isCompleted,
            onChanged: (_) => onToggle(),
          ),
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
            color: todo.isCompleted
                ? Theme.of(context).colorScheme.onSurfaceVariant
                : null,
          ),
        ),
        subtitle: Text(
          _dateFormat.format(todo.createdAt),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}

/// Shared date format for displaying [Todo.createdAt], kept consistent with
/// [TodoDetailScreen].
final _dateFormat = DateFormat('yyyy-MM-dd HH:mm');
