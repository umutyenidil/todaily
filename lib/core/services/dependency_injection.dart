import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todaily/features/auth/data/data_sources/auth_remote_data_src.dart';
import 'package:todaily/features/auth/data/data_sources/auth_remote_data_src_impl.dart';
import 'package:todaily/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:todaily/features/auth/domain/repositories/auth_repo.dart';
import 'package:todaily/features/auth/domain/use_cases/get_current_user_use_case.dart';
import 'package:todaily/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:todaily/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:todaily/features/on_boarding/data/data_sources/on_boarding_local_data_src.dart';
import 'package:todaily/features/on_boarding/data/data_sources/on_boarding_local_data_src_impl.dart';
import 'package:todaily/features/on_boarding/data/repositories/on_boarding_repo_impl.dart';
import 'package:todaily/features/on_boarding/domain/repositories/on_boarding_repo.dart';
import 'package:todaily/features/on_boarding/domain/use_cases/cache_first_time_use_case.dart';
import 'package:todaily/features/on_boarding/domain/use_cases/is_first_time_use_case.dart';
import 'package:todaily/features/on_boarding/presentation/blocs/on_boarding/on_boarding_bloc.dart';
import 'package:todaily/features/todo/data/data_sources/todo_remote_data_source.dart';
import 'package:todaily/features/todo/data/data_sources/todo_remote_data_source_impl.dart';
import 'package:todaily/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:todaily/features/todo/domain/repositories/todo_repository.dart';
import 'package:todaily/features/todo/domain/use_cases/add_todo_use_case.dart';
import 'package:todaily/features/todo/presentation/blocs/todo/todo_bloc.dart';

final sl = GetIt.instance;

Future<void> injectDependencies() async {
  await injectOnBoarding();
  await injectAuth();
  await injectTodo();
}

Future<void> injectAuth() async {
  sl
    ..registerFactory<AuthRemoteDataSrc>(
      () => AuthRemoteDataSrcImpl(
        firebaseAuth: FirebaseAuth.instance,
        firebaseFirestore: FirebaseFirestore.instance,
      ),
    )
    ..registerFactory<AuthRepo>(
      () => AuthRepoImpl(
        remoteSrc: sl<AuthRemoteDataSrc>(),
      ),
    )
    ..registerFactory<SignUpUseCase>(
      () => SignUpUseCase(
        repo: sl<AuthRepo>(),
      ),
    )
    ..registerFactory<GetCurrentUserUseCase>(
      () => GetCurrentUserUseCase(
        repo: sl<AuthRepo>(),
      ),
    )
    ..registerFactory<AuthBloc>(
      () => AuthBloc(
        signUp: sl<SignUpUseCase>(),
        getCurrentUser: sl<GetCurrentUserUseCase>(),
      ),
    );
}

Future<void> injectTodo() async {
  sl
    ..registerFactory<TodoRemoteDataSource>(
      () => TodoRemoteDataSourceImpl(
        firebaseFirestore: FirebaseFirestore.instance,
      ),
    )
    ..registerFactory<TodoRepository>(
      () => TodoRepositoryImpl(
        remoteDataSource: sl<TodoRemoteDataSource>(),
      ),
    )
    ..registerFactory<AddTodoUseCase>(
      () => AddTodoUseCase(
        repository: sl<TodoRepository>(),
      ),
    )
    ..registerFactory<TodoBloc>(
      () => TodoBloc(
        addTodo: sl<AddTodoUseCase>(),
      ),
    );
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
