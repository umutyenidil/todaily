import 'package:flutter/material.dart';
import 'package:todaily/core/config/env.dart';
import 'package:todaily/features/on_boarding/presentation/pages/on_boarding/on_boarding_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      home: OnBoardingPage(),
    );
  }
}
