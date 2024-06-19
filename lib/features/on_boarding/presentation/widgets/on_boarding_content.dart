import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todaily/core/extensions/build_context_ext.dart';
import 'package:todaily/core/extensions/widget_ext.dart';

class OnBoardingContent extends StatelessWidget {
  final String vector;
  final String title;
  final String description;

  const OnBoardingContent({
    super.key,
    required this.vector,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          vector,
          width: context.screenHeight * 0.5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: context.textTheme.displaySmall,
                textAlign: TextAlign.center,
              ).padding(bottom: 16),
              Text(
                description,
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
