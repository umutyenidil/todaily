import 'package:todaily/core/use_case/use_case.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/auth/domain/entities/auth_entity.dart';
import 'package:todaily/features/auth/domain/repositories/auth_repository.dart';

class SignInUseCase implements UseCase<AuthEntity, SignInParams> {
  final AuthRepository _authRepository;

  const SignInUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  ResultFuture<AuthEntity> call(
    SignInParams params,
  ) async {
    return await _authRepository.signIn(
      emailAddress: params.email,
      password: params.password,
    );
  }
}

class SignInParams {
  final String email;
  final String password;

  const SignInParams({
    required this.email,
    required this.password,
  });
}
