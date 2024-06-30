import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/auth/domain/entities/auth_entity.dart';

abstract interface class AuthRepository {
  ResultFuture<AuthEntity> signUp({
    required String fullName,
    required String emailAddress,
    required String password,
  });

  ResultFuture<AuthEntity> signIn({
    required String emailAddress,
    required String password,
  });

  ResultFuture<void> signOut();

  ResultFuture<AuthEntity?> getCurrentUser();
}
