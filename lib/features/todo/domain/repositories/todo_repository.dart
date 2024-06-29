import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/todo/domain/entities/todo_entity.dart';

abstract interface class TodoRepository {
  ResultFuture<void> addTodo({
    required String title,
    required String description,
  });

  ResultFuture<Stream<List<TodoEntity>>> getTodos();
}
