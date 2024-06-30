import 'package:todaily/core/use_case/use_case.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/auth/domain/entities/user_entity.dart';
import 'package:todaily/features/auth/domain/repositories/auth_repo.dart';

class SignUpUseCase implements UseCase<UserEntity, SignUpParams> {
  final AuthRepository repo;

  const SignUpUseCase({
    required this.repo,
  });

  @override
  ResultFuture<UserEntity> call(SignUpParams params) async {
    return await repo.signUp(
      fullName: params.fullName,
      emailAddress: params.emailAddress,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String fullName;
  final String emailAddress;
  final String password;

  SignUpParams({
    required this.fullName,
    required this.emailAddress,
    required this.password,
  });
}
