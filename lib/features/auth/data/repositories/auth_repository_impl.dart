import 'package:dartz/dartz.dart';
import 'package:todaily/core/errors/exceptions.dart';
import 'package:todaily/core/errors/failures.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:todaily/features/auth/domain/entities/auth_entity.dart';
import 'package:todaily/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSrc remoteSrc;

  const AuthRepositoryImpl({
    required this.remoteSrc,
  });

  @override
  ResultFuture<AuthEntity> signUp({
    required String fullName,
    required String emailAddress,
    required String password,
  }) async {
    try {
      final result = await remoteSrc.signUp(
        fullName: fullName,
        emailAddress: emailAddress,
        password: password,
      );

      return Right(result as AuthEntity);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(message: e.message),
      );
    }
  }

  @override
  ResultFuture<AuthEntity?> getCurrentUser() async {
    try {
      final result = await remoteSrc.getCurrentUser();

      return Right(result as AuthEntity?);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(message: e.message),
      );
    }
  }

  @override
  ResultFuture<void> signOut() async {
    try {
      await remoteSrc.signOut();

      return const Right(null);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(message: e.message),
      );
    }
  }

  @override
  ResultFuture<AuthEntity> signIn({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final result = await remoteSrc.signIn(
        emailAddress: emailAddress,
        password: password,
      );

      return Right(result as AuthEntity);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(message: e.message),
      );
    }
  }
}
