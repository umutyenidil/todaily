part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

final class SignUpEvent extends AuthEvent {
  final String fullName;
  final String emailAddress;
  final String password;

  const SignUpEvent({
    required this.fullName,
    required this.emailAddress,
    required this.password,
  });

  @override
  List<Object?> get props => [
        fullName,
        emailAddress,
        password,
      ];
}

final class GetCurrentUserEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

final class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [];
}
