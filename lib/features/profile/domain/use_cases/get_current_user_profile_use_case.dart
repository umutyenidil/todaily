import 'package:todaily/core/use_case/params.dart';
import 'package:todaily/core/use_case/use_case.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/profile/domain/entities/profile_entity.dart';
import 'package:todaily/features/profile/domain/repositories/profile_repository.dart';

class GetCurrentUserProfileUseCase implements UseCase<ProfileEntity, NoParams> {
  final ProfileRepository _profileRepository;

  const GetCurrentUserProfileUseCase({
    required ProfileRepository profileRepository,
  }) : _profileRepository = profileRepository;

  @override
  ResultFuture<ProfileEntity> call(
    NoParams params,
  ) async {
    return await _profileRepository.getCurrentUserProfile();
  }
}
