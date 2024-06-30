import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todaily/core/common/providers/profile_provider.dart';
import 'package:todaily/core/common/widgets/backgrounds/gradient_background.dart';
import 'package:todaily/core/resources/color_res.dart';
import 'package:todaily/core/utils/snack_bar_utils.dart';
import 'package:todaily/features/profile/presentation/widgets/update_profile_form.dart';

import '../../blocs/profile/profile_bloc.dart';

class UpdateProfile extends StatelessWidget {
  static const String path = '/ProfileUpdate';

  static route() => MaterialPageRoute(
        builder: (_) => page(),
      );

  static page() => const UpdateProfile();

  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileError) {
          SnackBarUtils.showSnackBar(context, state.message);
        }
        if (state is ProfileUpdateProfileSuccess) {
          context.read<ProfileProvider>().setProfile(state.profile);
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: ColorRes.TRANSPARENT,
          title: const Text(
            'ProfileUpdate',
          ),
          centerTitle: true,
        ),
        body: const GradientBackground(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: UpdateProfileForm(),
            ),
          ),
        ),
      ),
    );
  }
}
