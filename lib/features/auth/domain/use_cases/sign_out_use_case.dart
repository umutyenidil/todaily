import 'package:todaily/core/use_case/params.dart';
import 'package:todaily/core/use_case/use_case.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/auth/domain/repositories/auth_repo.dart';

class SignOutUseCase implements UseCase<void, NoParams> {
  final AuthRepository authRepository;

  const SignOutUseCase({
    required this.authRepository,
  });

  @override
  ResultFuture<void> call(
    NoParams params,
  ) async {
    return await authRepository.signOut();
  }
}
