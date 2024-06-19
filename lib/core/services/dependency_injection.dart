import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todaily/features/on_boarding/data/data_sources/on_boarding_local_data_src.dart';
import 'package:todaily/features/on_boarding/data/data_sources/on_boarding_local_data_src_impl.dart';
import 'package:todaily/features/on_boarding/data/repositories/on_boarding_repo_impl.dart';
import 'package:todaily/features/on_boarding/domain/repositories/on_boarding_repo.dart';
import 'package:todaily/features/on_boarding/domain/use_cases/cache_first_time_use_case.dart';
import 'package:todaily/features/on_boarding/domain/use_cases/is_first_time_use_case.dart';
import 'package:todaily/features/on_boarding/presentation/blocs/on_boarding/on_boarding_bloc.dart';

final sl = GetIt.instance;

Future<void> injectDependencies() async {
  await injectOnBoarding();
}

Future<void> injectOnBoarding() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl
    ..registerFactory<OnBoardingLocalDataSrc>(
      () => OnBoardingLocalDataSrcImpl(
        sharedPreferences: sharedPreferences,
      ),
    )
    ..registerFactory<OnBoardingRepo>(
      () => OnBoardingRepoImpl(
        localSrc: sl<OnBoardingLocalDataSrc>(),
      ),
    )
    ..registerFactory<CacheFirstTimeUseCase>(
      () => CacheFirstTimeUseCase(
        repo: sl<OnBoardingRepo>(),
      ),
    )
    ..registerFactory<IsFirstTimeUseCase>(
      () => IsFirstTimeUseCase(
        repo: sl<OnBoardingRepo>(),
      ),
    )
    ..registerFactory<OnBoardingBloc>(
      () => OnBoardingBloc(
        cacheFirstTime: sl<CacheFirstTimeUseCase>(),
        isFirstTime: sl<IsFirstTimeUseCase>(),
      ),
    );
}
