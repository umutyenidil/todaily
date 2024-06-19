import 'package:todaily/core/use_case/params.dart';
import 'package:todaily/core/use_case/use_case.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/on_boarding/domain/repositories/on_boarding_repo.dart';

class CacheFirstTimeUseCase implements UseCase<void, NoParams> {
  final OnBoardingRepo repo;

  const CacheFirstTimeUseCase({
    required this.repo,
  });

  @override
  ResultFuture<void> call(NoParams params) async {
    return await repo.cacheFirstTime();
  }
}
