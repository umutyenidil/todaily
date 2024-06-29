import 'package:dartz/dartz.dart';
import 'package:todaily/core/errors/exceptions.dart';
import 'package:todaily/core/errors/failures.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  @override
  ResultFuture<void> addTodo({
    required String title,
    required String description,
  }) async {
    try {
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
