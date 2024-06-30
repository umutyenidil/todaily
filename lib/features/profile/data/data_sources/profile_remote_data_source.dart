import '../models/profile_model.dart';

abstract interface class ProfileRemoteDataSource {
  Future<ProfileModel> getCurrentUserProfile();

  Future<ProfileModel> updateProfile({
    String? fullName,
  });
}
