import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todaily/core/errors/exceptions.dart';
import 'package:todaily/core/utils/constants.dart';
import 'package:todaily/features/auth/data/data_sources/auth_remote_data_src.dart';
import 'package:todaily/features/auth/data/models/user_model.dart';

class AuthRemoteDataSrcImpl implements AuthRemoteDataSrc {
  final SupabaseClient supabase;

  const AuthRemoteDataSrcImpl({
    required this.supabase,
  });

  @override
  Future<UserModel> signUp({
    required String fullName,
    required String emailAddress,
    required String password,
  }) async {
    try {
      final result = await supabase.auth.signUp(
        email: emailAddress,
        password: password,
        data: {
          kFullName: fullName,
        },
      );

      if (result.user == null) {
        throw const ServerException(message: 'User is not created');
      }

      return UserModel(
        id: result.user!.id,
        fullName: fullName,
        emailAddress: result.user!.email!,
      );
    } on ServerException {
      rethrow;
    } on AuthException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
