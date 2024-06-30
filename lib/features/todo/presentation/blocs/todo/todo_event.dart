part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();
}

final class AddTodoEvent extends TodoEvent {
  final String title;
  final String description;

  const AddTodoEvent({
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [
        title,
        description,
      ];
}

final class GetTodosEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}

final class DeleteTodoEvent extends TodoEvent {
  final String id;

  const DeleteTodoEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [];
}
