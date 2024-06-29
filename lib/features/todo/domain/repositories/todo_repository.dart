import 'package:todaily/core/utils/typedefs.dart';

abstract interface class TodoRepository {
  ResultFuture<void> addTodo({
    required String title,
    required String description,
  });
}
