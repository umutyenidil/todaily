import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todaily/core/use_case/params.dart';
import 'package:todaily/features/auth/domain/use_cases/sign_out_use_case.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final SignOutUseCase _signOut;

  ProfileBloc({
    required SignOutUseCase signOut,
  })  : _signOut = signOut,
        super(ProfileInitial()) {
    // on<ProfileEvent>((event, emit) {});
    on<ProfileEvent>((_, emit) => emit(ProfileLoading()));
    on<SignOutEvent>(_onSignOutEvent);
  }

  Future<void> _onSignOutEvent(SignOutEvent event, Emitter<ProfileState> emit) async {
    final result = await _signOut(NoParams());

    return result.fold(
      (failure) => emit(
        ProfileError(message: failure.message),
      ),
      (_) => emit(
        ProfileSignOutSuccess(),
      ),
    );
  }
}
