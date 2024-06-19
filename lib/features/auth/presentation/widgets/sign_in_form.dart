import 'package:flutter/material.dart';
import 'package:todaily/core/common/widgets/button.dart';
import 'package:todaily/core/common/widgets/input.dart';
import 'package:todaily/core/extensions/widget_ext.dart';
import 'package:todaily/core/resources/color_res.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Input(
            controller: _emailController,
            hint: 'Email address',
            backgroundColor: ColorRes.WHITE,
          ).padding(bottom: 16),
          Input(
            controller: _passwordController,
            obscure: true,
            hint: 'Password',
            backgroundColor: ColorRes.WHITE,
          ).padding(bottom: 16),
          Button(
            text: 'Sign In',
            textColor: ColorRes.WHITE,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                debugPrint('form is valid');
              }
            },
            backgroundColor: ColorRes.SKY500,
          ),
        ],
      ),
    );
  }
}
