part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

final class SignOutEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

final class GetCurrentUserProfileEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

final class UpdateProfileEvent extends ProfileEvent {
  final String? fullName;

  const UpdateProfileEvent({
    required this.fullName,
  });

  @override
  List<Object?> get props => [];
}
