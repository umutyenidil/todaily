import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todaily/core/common/widgets/backgrounds/gradient_background.dart';
import 'package:todaily/core/common/widgets/button.dart';
import 'package:todaily/core/extensions/widget_ext.dart';
import 'package:todaily/core/resources/color_res.dart';
import 'package:todaily/core/services/dependency_injection.dart';
import 'package:todaily/features/auth/presentation/pages/sign_in/sign_in_page.dart';
import 'package:todaily/features/profile/presentation/blocs/profile/profile_bloc.dart';
import 'package:todaily/features/profile/presentation/pages/update_profile/update_profile_page.dart';

class Profile extends StatelessWidget {
  static const String path = '/ProfilePage';

  static route() => MaterialPageRoute(
        builder: (_) => page(),
      );

  static page() => BlocProvider(
        create: (_) => sl<ProfileBloc>(),
        child: const Profile(),
      );

  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSignOutSuccess) {
          Navigator.of(context).pushAndRemoveUntil(SignIn.route(), (_) => false);
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: ColorRes.TRANSPARENT,
          title: const Text(
            'ProfilePage',
          ),
          centerTitle: true,
        ),
        body: GradientBackground(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Button(
                    onPressed: () {
                      Navigator.of(context).push(UpdateProfile.route());
                    },
                    text: "Edit Profile",
                  ).padding(bottom: 16),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      return Button(
                        isLoading: state is ProfileLoading,
                        onPressed: () {
                          context.read<ProfileBloc>().add(SignOutEvent());
                        },
                        text: "Sign out",
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
