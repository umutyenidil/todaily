import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_cases/sign_up_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase signUp;

  AuthBloc({
    required this.signUp,
  }) : super(AuthInitial()) {
    // on<AuthEvent>((event, emit) {});
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<SignUpEvent>(_onSignUpEvent);
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
