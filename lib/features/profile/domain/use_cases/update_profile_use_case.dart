import 'package:todaily/core/use_case/use_case.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:todaily/features/profile/domain/entities/profile_entity.dart';
import 'package:todaily/features/profile/domain/repositories/profile_repository.dart';

class UpdateProfileUseCase implements UseCase<ProfileEntity, UpdateProfileParams> {
  final ProfileRepository _profileRepository;

  const UpdateProfileUseCase({
    required ProfileRepository profileRepository,
  }) : _profileRepository = profileRepository;

  @override
  ResultFuture<ProfileEntity> call(
    UpdateProfileParams params,
  ) async {
    return await _profileRepository.updateProfile(
      fullName: params.fullName,
    );
  }
}

class UpdateProfileParams {
  final String? fullName;

  const UpdateProfileParams({this.fullName});
}
