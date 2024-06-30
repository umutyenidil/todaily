import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todaily/core/errors/exceptions.dart';
import 'package:todaily/core/utils/constants.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/todo/data/models/todo_model.dart';

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

  @override
  Stream<List<TodoModel>> getTodos() {
    try {
      final streamController = StreamController<List<TodoModel>>();

      firebaseFirestore.collection(kTodos).snapshots().listen((snapshot) {
        final result = snapshot.docs.map((doc) {
          final ResultMap data = doc.data();
          return TodoModel(
            id: doc.id,
            title: data[kTitle],
            description: data[kDescription],
          );
        }).toList();

        streamController.add(result);
      });

      return streamController.stream;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> deleteTodo({
    required String id,
  }) async {
    try {
      final query = firebaseFirestore.collection(kTodos);

      final docRef = query.doc(id);

      await docRef.delete();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
