import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_cases/add_todo_use_case.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final AddTodoUseCase addTodo;

  TodoBloc({
    required this.addTodo,
  }) : super(TodoInitial()) {
    // on<TodoEvent>((event, emit) {});
    on<TodoEvent>((_, emit) => emit(TodoLoading()));
    on<AddTodoEvent>(_onAddTodoEvent);
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
