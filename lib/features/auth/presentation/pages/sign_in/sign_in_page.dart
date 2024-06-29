import 'package:flutter/material.dart';
import 'package:todaily/core/common/widgets/backgrounds/gradient_background.dart';
import 'package:todaily/core/extensions/build_context_ext.dart';
import 'package:todaily/core/extensions/widget_ext.dart';
import 'package:todaily/core/resources/color_res.dart';
import 'package:todaily/core/resources/edge_insets_res.dart';
import 'package:todaily/features/auth/presentation/pages/sign_up/sign_up_page.dart';
import 'package:todaily/features/auth/presentation/widgets/sign_in_form.dart';

class SignInPage extends StatefulWidget {
  static const String path = '/SignInPage';

  static route() => MaterialPageRoute(
        builder: (_) => const SignInPage(),
      );

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
    );
  }
}
