import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todaily/core/use_case/params.dart';

import '../../../domain/use_cases/cache_first_time_use_case.dart';
import '../../../domain/use_cases/is_first_time_use_case.dart';

part 'on_boarding_event.dart';

part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final CacheFirstTimeUseCase cacheFirstTime;
  final IsFirstTimeUseCase isFirstTime;

  OnBoardingBloc({
    required this.cacheFirstTime,
    required this.isFirstTime,
  }) : super(OnBoardingInitial()) {
    on<OnBoardingEvent>((_, emit) => emit(OnBoardingLoading()));
    on<CacheFirstTimeEvent>(_onCacheFirstTimeEvent);
    on<IsFirstTimeEvent>(_onIsFirstTimeEvent);
  }

  Future<void> _onCacheFirstTimeEvent(CacheFirstTimeEvent event, Emitter<OnBoardingState> emit) async {
    final result = await cacheFirstTime(NoParams());

    result.fold(
      (failure) => emit(OnBoardingError(message: failure.message)),
      (_) => emit(OnBoardingCacheFirstTimeSuccess()),
    );
  }

  Future<void> _onIsFirstTimeEvent(IsFirstTimeEvent event, Emitter<OnBoardingState> emit) async {
    final result = await isFirstTime(NoParams());

    result.fold(
      (failure) => emit(OnBoardingError(message: failure.message)),
      (isFirstTime) => emit(OnBoardingIsFirstTimeSuccess(isFirstTime: isFirstTime)),
    );
  }
}
