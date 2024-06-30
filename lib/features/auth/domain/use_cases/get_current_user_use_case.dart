import 'package:todaily/core/use_case/use_case.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/auth/domain/entities/auth_entity.dart';
import 'package:todaily/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUserUseCase implements UseCase<AuthEntity?, void> {
  final AuthRepository repo;

  const GetCurrentUserUseCase({
    required this.repo,
  });

  @override
  ResultFuture<AuthEntity?> call(void params) async {
    return await repo.getCurrentUser();
  }
}
