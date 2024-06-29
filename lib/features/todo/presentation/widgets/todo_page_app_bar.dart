import 'package:flutter/material.dart';
import 'package:todaily/core/config/env.dart';
import 'package:todaily/core/extensions/build_context_ext.dart';
import 'package:todaily/core/resources/edge_insets_res.dart';

class TodoPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsRes.B12,
        child: Padding(
          padding: EdgeInsetsRes.H16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Good Afternoon,\n',
                  style: context.textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: 'Umut Yenidil',
                      style: context.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                kAppVersion,
                style: context.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 12);
}
