part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ProfileLoading extends ProfileState {
  @override
  List<Object?> get props => [];
}

final class ProfileError extends ProfileState {
  final String message;

  const ProfileError({
    required this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

final class ProfileSignOutSuccess extends ProfileState {
  @override
  List<Object?> get props => [];
}