import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todaily/core/common/pages/home/home_page.dart';
import 'package:todaily/core/common/widgets/backgrounds/gradient_background.dart';
import 'package:todaily/core/extensions/build_context_ext.dart';
import 'package:todaily/core/extensions/widget_ext.dart';
import 'package:todaily/core/resources/color_res.dart';
import 'package:todaily/core/resources/edge_insets_res.dart';
import 'package:todaily/core/utils/snack_bar_utils.dart';
import 'package:todaily/features/auth/presentation/pages/sign_up/sign_up_page.dart';
import 'package:todaily/features/auth/presentation/widgets/sign_in_form.dart';

import '../../blocs/auth/auth_bloc.dart';

class SignIn extends StatefulWidget {
  static const String path = '/SignInPage';

  static route() => MaterialPageRoute(
        builder: (_) => page(),
      );

  static page() => const SignIn();

  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          SnackBarUtils.showSnackBar(context, state.message);
        }
        if (state is AuthSignInSuccess) {
          Navigator.of(context).pushAndRemoveUntil(Home.route(), (_) => false);
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: GradientBackground(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsetsRes.ALL16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign\nIn',
                      style: context.textTheme.displayMedium,
                    ),
                  ).padding(bottom: 32),
                  const SignInForm().padding(bottom: 32),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(SignUpPage.route());
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account?",
                        style: context.textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: " Sign Up",
                            style: context.textTheme.titleSmall!.copyWith(
                              color: ColorRes.SKY500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
