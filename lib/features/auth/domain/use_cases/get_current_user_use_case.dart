import 'package:todaily/core/use_case/use_case.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/auth/domain/entities/user_entity.dart';
import 'package:todaily/features/auth/domain/repositories/auth_repo.dart';

class GetCurrentUserUseCase implements UseCase<UserEntity?, void> {
  final AuthRepository repo;

  const GetCurrentUserUseCase({
    required this.repo,
  });

  @override
  ResultFuture<UserEntity?> call(void params) async {
    return await repo.getCurrentUser();
  }
}
