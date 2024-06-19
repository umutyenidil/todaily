import 'package:todaily/core/use_case/params.dart';
import 'package:todaily/core/use_case/use_case.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/on_boarding/domain/repositories/on_boarding_repo.dart';

class IsFirstTimeUseCase implements UseCase<bool, NoParams> {
  final OnBoardingRepo repo;

  const IsFirstTimeUseCase({
    required this.repo,
  });

  @override
  ResultFuture<bool> call(NoParams params) async {
    return await repo.isFirstTime();
  }
}
