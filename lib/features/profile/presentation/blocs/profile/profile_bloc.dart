import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todaily/core/use_case/params.dart';
import 'package:todaily/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:todaily/features/profile/domain/entities/profile_entity.dart';
import 'package:todaily/features/profile/domain/use_cases/get_current_user_profile_use_case.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetCurrentUserProfileUseCase _getCurrentUserProfile;
  final SignOutUseCase _signOut;

  ProfileBloc({
    required SignOutUseCase signOut,
    required GetCurrentUserProfileUseCase getCurrentProfileUseCase,
  })  : _signOut = signOut,
        _getCurrentUserProfile = getCurrentProfileUseCase,
        super(ProfileInitial()) {
    // on<ProfileEvent>((event, emit) {});
    on<ProfileEvent>((_, emit) => emit(ProfileLoading()));
    on<SignOutEvent>(_onSignOutEvent);
    on<GetCurrentUserProfileEvent>(_onGetCurrentUserProfileEvent);
  }

  Future<void> _onGetCurrentUserProfileEvent(
    GetCurrentUserProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final result = await _getCurrentUserProfile(NoParams());

    return result.fold(
      (failure) => emit(
        ProfileError(
          message: failure.message,
        ),
      ),
      (profile) => emit(
        ProfileGetCurrentUserProfileSuccess(
          profile: profile,
        ),
      ),
    );
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
