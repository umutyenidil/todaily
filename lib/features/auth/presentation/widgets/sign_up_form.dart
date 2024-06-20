import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todaily/core/common/widgets/button.dart';
import 'package:todaily/core/common/widgets/input.dart';
import 'package:todaily/core/extensions/widget_ext.dart';
import 'package:todaily/core/resources/color_res.dart';
import 'package:todaily/features/auth/presentation/blocs/auth/auth_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Input(
            controller: _fullNameController,
            hint: 'Full Name',
            backgroundColor: ColorRes.WHITE,
          ).padding(bottom: 16),
          Input(
            controller: _emailController,
            hint: 'Email address',
            backgroundColor: ColorRes.WHITE,
            type: TextInputType.emailAddress,
          ).padding(bottom: 16),
          Input(
            controller: _passwordController,
            obscure: true,
            hint: 'Password',
            backgroundColor: ColorRes.WHITE,
          ).padding(bottom: 16),
          Input(
            controller: _confirmPasswordController,
            obscure: true,
            hint: 'Confirm Password',
            backgroundColor: ColorRes.WHITE,
            isRequired: false,
            validator: (value) {
              if (value != _passwordController.text.trim()) {
                return 'Passwords are not matched';
              }
            },
          ).padding(bottom: 16),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Button(
                isLoading: state is AuthLoading,
                text: 'Sign Up',
                textColor: ColorRes.WHITE,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                      SignUpEvent(
                        fullName: _fullNameController.text.trim(),
                        emailAddress: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      ),
                    );
                  }
                },
                backgroundColor: ColorRes.SKY500,
              );
            },
          ),
        ],
      ),
    );
  }
}
