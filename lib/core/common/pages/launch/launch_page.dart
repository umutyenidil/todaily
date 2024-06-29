import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:todaily/core/common/widgets/backgrounds/gradient_background.dart';
import 'package:todaily/core/resources/lottie_res.dart';
import 'package:todaily/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:todaily/features/auth/presentation/pages/sign_in/sign_in_page.dart';
import 'package:todaily/features/on_boarding/presentation/blocs/on_boarding/on_boarding_bloc.dart';
import 'package:todaily/features/on_boarding/presentation/pages/on_boarding/on_boarding_page.dart';
import 'package:todaily/features/todo/presentation/pages/todo_page.dart';

class LaunchPage extends StatefulWidget {
  static const String path = '/LaunchPage';

  static route() => MaterialPageRoute(
        builder: (_) => const LaunchPage(),
      );

  const LaunchPage({super.key});

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Durations.long4).then(
      (_) => context.read<OnBoardingBloc>().add(IsFirstTimeEvent()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<OnBoardingBloc, OnBoardingState>(
          listener: (context, state) {
            if (state is OnBoardingIsFirstTimeSuccess) {
              if (!state.isFirstTime) {
                context.read<AuthBloc>().add(GetCurrentUserEvent());
              } else {
                Navigator.of(context).pushReplacement(OnBoardingPage.route());
              }
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthGetCurrentUserSuccess) {
              final user = state.user;
              if (user != null) {
                Navigator.of(context).pushReplacement(TodoPage.route());
              } else {
                Navigator.of(context).pushReplacement(SignInPage.route());
              }
            }
          },
        ),
      ],
      child: Scaffold(
        body: GradientBackground(
          child: SafeArea(
            child: Center(
              child: Lottie.asset(
                LottieRes.WORKING_BRAIN,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
