part of 'on_boarding_bloc.dart';

sealed class OnBoardingState extends Equatable {
  const OnBoardingState();
}

final class OnBoardingInitial extends OnBoardingState {
  @override
  List<Object> get props => [];
}

final class OnBoardingLoading extends OnBoardingState {
  @override
  List<Object> get props => [];
}

final class OnBoardingError extends OnBoardingState {
  final String message;

  const OnBoardingError({
    required this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

final class OnBoardingCacheFirstTimeSuccess extends OnBoardingState {
  @override
  List<Object?> get props => [];
}

final class OnBoardingIsFirstTimeSuccess extends OnBoardingState {
  final bool isFirstTime;

  const OnBoardingIsFirstTimeSuccess({
    required this.isFirstTime,
  });

  @override
  List<Object?> get props => [
        isFirstTime,
      ];
}
