import 'package:flutter/material.dart';
import 'package:todaily/core/extensions/build_context_ext.dart';
import 'package:todaily/core/resources/color_res.dart';

class GradientBackground extends StatelessWidget {
  final Widget? child;

  const GradientBackground({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: context.screenHeight,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorRes.SKY300,
              ColorRes.GREEN300,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      ),
    );
  }
}
