import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  static const String path = '/OnBoardingPage';

  static route() => MaterialPageRoute(
    builder: (_) => const OnBoardingPage(),
  );

  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OnBoardingPage',
        ),
        centerTitle: true,
      ),
    );
  }
}
