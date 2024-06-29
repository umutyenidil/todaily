import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todaily/core/errors/exceptions.dart';
import 'package:todaily/core/utils/constants.dart';

import 'todo_remote_data_source.dart';

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  const TodoRemoteDataSourceImpl({
    required this.firebaseFirestore,
  });

  @override
  Future<void> addTodo({
    required String title,
    required String description,
  }) async {
    try {
      await firebaseFirestore.collection(kTodos).add({
        kTitle: title,
        kDescription: description,
      });
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
