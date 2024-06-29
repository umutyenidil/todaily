import '../models/todo_model.dart';

abstract interface class TodoRemoteDataSource {
  Future<void> addTodo({
    required String title,
    required String description,
  });

  Stream<List<TodoModel>> getTodos();
}
