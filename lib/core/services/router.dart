import 'package:flutter/material.dart';
import 'package:todaily/features/on_boarding/presentation/pages/on_boarding/on_boarding_page.dart';

PageRoute generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return OnBoardingPage.route();

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
