import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todaily/core/use_case/params.dart';
import 'package:todaily/features/todo/domain/use_cases/delete_todo_use_case.dart';

import '../../../domain/entities/todo_entity.dart';
import '../../../domain/use_cases/add_todo_use_case.dart';
import '../../../domain/use_cases/get_todos_use_case.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final AddTodoUseCase addTodo;
  final GetTodosUseCase getTodos;
  final DeleteTodoUseCase deleteTodo;

  TodoBloc({
    required this.addTodo,
    required this.getTodos,
    required this.deleteTodo,
  }) : super(TodoInitial()) {
    // on<TodoEvent>((event, emit) {});
    on<TodoEvent>((_, emit) => emit(TodoLoading()));
    on<AddTodoEvent>(_onAddTodoEvent);
    on<GetTodosEvent>(_onGetTodosEvent);
    on<DeleteTodoEvent>(_onDeleteTodoEvent);
  }

  Future<void> _onDeleteTodoEvent(
    DeleteTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    final result = await deleteTodo(
      DeleteTodoParams(
        id: event.id,
      ),
    );

    return result.fold(
      (failure) => emit(
        TodoError(
          message: failure.message,
        ),
      ),
      (_) => emit(
        TodoDeleteTodoSuccess(),
      ),
    );
  }

  Future<void> _onGetTodosEvent(GetTodosEvent event, Emitter<TodoState> emit) async {
    final result = await getTodos(NoParams());

    return result.fold(
      (failure) => emit(
        TodoError(message: failure.message),
      ),
      (data) {
        return emit.forEach(data, onData: (data) => TodoGetTodosSuccess(todos: data));
      },
    );
  }

  Future<void> _onAddTodoEvent(AddTodoEvent event, Emitter<TodoState> emit) async {
    final result = await addTodo(AddTodoParams(
      title: event.title,
      description: event.description,
    ));

    result.fold(
      (failure) => emit(
        TodoError(message: failure.message),
      ),
      (_) => emit(
        TodoAddTodoSuccess(),
      ),
    );
  }
}
