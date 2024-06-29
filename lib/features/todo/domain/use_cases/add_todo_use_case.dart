import 'package:todaily/core/use_case/use_case.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/todo/domain/repositories/todo_repository.dart';

class AddTodoUseCase implements UseCase<void, AddTodoParams> {
  final TodoRepository repository;

  const AddTodoUseCase({
    required this.repository,
  });

  @override
  ResultFuture<void> call(
    AddTodoParams params,
  ) async {
    return await repository.addTodo(
      title: params.title,
      description: params.description,
    );
  }
}

class AddTodoParams {
  final String title;
  final String description;

  const AddTodoParams({
    required this.title,
    required this.description,
  });
}
