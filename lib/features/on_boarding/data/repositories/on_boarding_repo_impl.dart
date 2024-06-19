import 'package:dartz/dartz.dart';
import 'package:todaily/core/errors/exceptions.dart';
import 'package:todaily/core/errors/failures.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/on_boarding/data/data_sources/on_boarding_local_data_src.dart';
import 'package:todaily/features/on_boarding/domain/repositories/on_boarding_repo.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  final OnBoardingLocalDataSrc localSrc;

  const OnBoardingRepoImpl({
    required this.localSrc,
  });

  @override
  ResultFuture<void> cacheFirstTime() async {
    try {
      await localSrc.cacheFirstTime();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    }
  }

  @override
  ResultFuture<bool> isFirstTime() async {
    try {
      final result = await localSrc.isFirstTime();

      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    }
  }
}
