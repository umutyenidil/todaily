import '../models/user_model.dart';

abstract interface class AuthRemoteDataSrc {
  Future<UserModel> signUp({
    required String fullName,
    required String emailAddress,
    required String password,
  });
}
