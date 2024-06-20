import 'package:dartz/dartz.dart';
import 'package:todaily/core/errors/exceptions.dart';
import 'package:todaily/core/errors/failures.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/auth/data/data_sources/auth_remote_data_src.dart';
import 'package:todaily/features/auth/domain/entities/user_entity.dart';
import 'package:todaily/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSrc remoteSrc;

  const AuthRepoImpl({
    required this.remoteSrc,
  });

  @override
  ResultFuture<UserEntity> signUp({
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

      return Right(result as UserEntity);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(message: e.message),
      );
    }
  }
}
