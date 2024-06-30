import 'package:todaily/core/use_case/use_case.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/todo/domain/repositories/todo_repository.dart';

class DeleteTodoUseCase implements UseCase<void, DeleteTodoParams> {
  final TodoRepository todoRepository;

  const DeleteTodoUseCase({
    required this.todoRepository,
  });

  @override
  ResultFuture<void> call(
    DeleteTodoParams params,
  ) async {
    return await todoRepository.deleteTodo(
      id: params.id,
    );
  }
}

class DeleteTodoParams {
  final String id;

  DeleteTodoParams({required this.id});
}
