import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/auth/domain/entities/user_entity.dart';

abstract interface class AuthRepo {
  ResultFuture<UserEntity> signUp({
    required String fullName,
    required String emailAddress,
    required String password,
  });
}
