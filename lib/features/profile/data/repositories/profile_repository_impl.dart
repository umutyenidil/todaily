import 'package:dartz/dartz.dart';
import 'package:todaily/core/errors/exceptions.dart';
import 'package:todaily/core/errors/failures.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:todaily/features/profile/domain/entities/profile_entity.dart';
import 'package:todaily/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;

  const ProfileRepositoryImpl({
    required ProfileRemoteDataSource profileRemoteDataSource,
  }) : _profileRemoteDataSource = profileRemoteDataSource;

  @override
  ResultFuture<ProfileEntity> getCurrentUserProfile() async {
    try {
      final result = await _profileRemoteDataSource.getCurrentUserProfile();

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<ProfileEntity> updateProfile({
    String? fullName,
  }) async {
    try {
      final result = await _profileRemoteDataSource.updateProfile(
        fullName: fullName,
      );

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
