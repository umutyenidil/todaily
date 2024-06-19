part of 'on_boarding_bloc.dart';

sealed class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();
}

final class CacheFirstTimeEvent extends OnBoardingEvent {
  @override
  List<Object?> get props => [];
}

final class IsFirstTimeEvent extends OnBoardingEvent {
  @override
  List<Object?> get props => [];
}
