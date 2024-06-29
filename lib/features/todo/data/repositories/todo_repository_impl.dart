import 'package:dartz/dartz.dart';
import 'package:todaily/core/errors/exceptions.dart';
import 'package:todaily/core/errors/failures.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/todo/data/data_sources/todo_remote_data_source.dart';
import 'package:todaily/features/todo/domain/entities/todo_entity.dart';
import 'package:todaily/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;

  const TodoRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  ResultFuture<void> addTodo({
    required String title,
    required String description,
  }) async {
    try {
      await remoteDataSource.addTodo(
        title: title,
        description: description,
      );

      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<Stream<List<TodoEntity>>> getTodos() async {
    try {
      final result = remoteDataSource.getTodos();

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
