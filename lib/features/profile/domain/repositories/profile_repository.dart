import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/profile/domain/entities/profile_entity.dart';

abstract interface class ProfileRepository {
  ResultFuture<ProfileEntity> getCurrentUserProfile();
}