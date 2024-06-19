import 'package:flutter/material.dart';
import 'package:todaily/core/extensions/build_context_ext.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 0),
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: backgroundColor,
      ),
      onPressed: () {
        if (!isLoading) onPressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          !isLoading
              ? Text(
                  text,
                  style: context.textTheme.titleMedium!.copyWith(
                    color: textColor,
                  ),
                )
              : SizedBox.square(
                  dimension: 24,
                  child: CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                    strokeWidth: 3.0,
                    color: textColor,
                  ),
                ),
        ],
      ),
    );
  }
}
