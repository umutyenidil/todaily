import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todaily/core/use_case/params.dart';
import 'package:todaily/features/auth/domain/entities/auth_entity.dart';
import 'package:todaily/features/auth/domain/use_cases/sign_in_use_case.dart';

import '../../../domain/use_cases/get_current_user_use_case.dart';
import '../../../domain/use_cases/sign_up_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase _signUp;
  final SignInUseCase _signIn;
  final GetCurrentUserUseCase _getCurrentUser;

  AuthBloc({
    required SignUpUseCase signUp,
    required SignInUseCase signIn,
    required GetCurrentUserUseCase getCurrentUser,
  })  : _signUp = signUp,
        _signIn = signIn,
        _getCurrentUser = getCurrentUser,
        super(AuthInitial()) {
    // on<AuthEvent>((event, emit) {});
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<SignUpEvent>(_onSignUpEvent);
    on<GetCurrentUserEvent>(_onGetCurrentUserEvent);
    on<SignInEvent>(_onSignInEvent);
  }

  Future<void> _onSignInEvent(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    await Future.delayed(Durations.extralong4);

    final result = await _signIn(SignInParams(
      email: event.email,
      password: event.password,
    ));

    return result.fold(
      (failure) => emit(
        AuthError(message: failure.message),
      ),
      (_) => emit(
        AuthSignInSuccess(),
      ),
    );
  }

  Future<void> _onGetCurrentUserEvent(
    GetCurrentUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _getCurrentUser(NoParams());

    result.fold(
      (failure) => emit(
        AuthError(message: failure.message),
      ),
      (data) => emit(
        AuthGetCurrentUserSuccess(user: data),
      ),
    );
  }

  Future<void> _onSignUpEvent(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _signUp(SignUpParams(
      fullName: event.fullName,
      emailAddress: event.emailAddress,
      password: event.password,
    ));

    result.fold(
      (failure) => emit(
        AuthError(message: failure.message),
      ),
      (_) => emit(AuthSignUpSuccess()),
    );
  }
}
