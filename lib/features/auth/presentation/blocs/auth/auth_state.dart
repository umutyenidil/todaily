part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

final class AuthError extends AuthState {
  final String message;

  const AuthError({
    required this.message,
  });

  @override
  List<Object?> get props => [];
}

final class AuthSignUpSuccess extends AuthState {
  @override
  List<Object?> get props => [];
}

final class AuthGetCurrentUserSuccess extends AuthState {
  final AuthEntity? user;

  const AuthGetCurrentUserSuccess({
    required this.user,
  });

  @override
  List<Object?> get props => [
        user,
      ];
}

final class AuthSignInSuccess extends AuthState {
  @override
  List<Object?> get props => [];
}
