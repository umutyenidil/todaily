part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();
}

final class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}

final class TodoLoading extends TodoState {
  @override
  List<Object?> get props => [];
}

final class TodoError extends TodoState {
  final String message;

  const TodoError({
    required this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

final class TodoAddTodoSuccess extends TodoState {
  @override
  List<Object?> get props => [];
}

final class TodoGetTodosSuccess extends TodoState {
  final List<TodoEntity> todos;

  const TodoGetTodosSuccess({
    required this.todos,
  });

  @override
  List<Object?> get props => [
        todos,
      ];
}
