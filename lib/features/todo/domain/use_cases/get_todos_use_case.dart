import 'package:todaily/core/use_case/params.dart';
import 'package:todaily/core/use_case/use_case.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/todo/domain/entities/todo_entity.dart';
import 'package:todaily/features/todo/domain/repositories/todo_repository.dart';

class GetTodosUseCase implements UseCase<Stream<List<TodoEntity>>, NoParams> {
  final TodoRepository repository;

  const GetTodosUseCase({
    required this.repository,
  });

  @override
  ResultFuture<Stream<List<TodoEntity>>> call(NoParams params) async {
    return await repository.getTodos();
  }
}
