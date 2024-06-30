part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

final class SignOutEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}
