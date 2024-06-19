import 'package:flutter/material.dart';
import 'package:todaily/core/common/widgets/backgrounds/gradient_background.dart';
import 'package:todaily/core/extensions/build_context_ext.dart';
import 'package:todaily/core/extensions/widget_ext.dart';
import 'package:todaily/core/resources/color_res.dart';
import 'package:todaily/core/resources/edge_insets_res.dart';
import 'package:todaily/features/auth/presentation/pages/sign_in/sign_in_page.dart';
import 'package:todaily/features/auth/presentation/widgets/sign_up_form.dart';

class SignUpPage extends StatefulWidget {
  static const String path = '/SignInPage';

  static route() => MaterialPageRoute(
        builder: (_) => const SignUpPage(),
      );

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Sign\nUp',
                    style: context.textTheme.displayMedium,
                  ),
                ).padding(bottom: 32),
                const SignUpForm().padding(bottom: 32),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(SignInPage.route());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account?",
                      style: context.textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: " Sign In",
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
    );
  }
}
