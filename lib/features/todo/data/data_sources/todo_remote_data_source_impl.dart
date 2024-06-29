import 'package:todaily/core/errors/exceptions.dart';

import 'todo_remote_data_source.dart';

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {

  const TodoRemoteDataSourceImpl();

  @override
  Future<void> addTodo({
    required String title,
    required String description,
  }) async {
    try {
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
