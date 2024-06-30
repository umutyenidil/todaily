import '../models/auth_model.dart';

abstract interface class AuthRemoteDataSrc {
  Future<AuthModel> signUp({
    required String fullName,
    required String emailAddress,
    required String password,
  });

  Future<AuthModel> signIn({
    required String emailAddress,
    required String password,
  });

  Future<void> signOut();

  Future<AuthModel?> getCurrentUser();
}
