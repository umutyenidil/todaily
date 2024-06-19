import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  static const String path = '/SignInPage';

  static route() => MaterialPageRoute(
    builder: (_) => const SignInPage(),
  );
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SignInPage',
        ),
        centerTitle: true,
      ),
    );
  }
}
