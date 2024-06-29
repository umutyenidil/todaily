import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todaily/core/use_case/params.dart';
import 'package:todaily/features/auth/domain/entities/user_entity.dart';

import '../../../domain/use_cases/get_current_user_use_case.dart';
import '../../../domain/use_cases/sign_up_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase signUp;
  final GetCurrentUserUseCase getCurrentUser;

  AuthBloc({
    required this.signUp,
    required this.getCurrentUser,
  }) : super(AuthInitial()) {
    // on<AuthEvent>((event, emit) {});
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<SignUpEvent>(_onSignUpEvent);
    on<GetCurrentUserEvent>(_onGetCurrentUserEvent);
  }

  Future<void> _onGetCurrentUserEvent(GetCurrentUserEvent event, Emitter<AuthState> emit) async {
    final result = await getCurrentUser(NoParams());

    result.fold(
      (failure) => emit(
        AuthError(message: failure.message),
      ),
      (data) => emit(
        AuthGetCurrentUserSuccess(user: data),
      ),
    );
  }

  Future<void> _onSignUpEvent(SignUpEvent event, Emitter<AuthState> emit) async {
    final result = await signUp(SignUpParams(
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
