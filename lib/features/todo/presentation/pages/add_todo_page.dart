import 'package:flutter/material.dart';
import 'package:todaily/core/common/widgets/backgrounds/gradient_background.dart';
import 'package:todaily/core/common/widgets/input.dart';
import 'package:todaily/core/extensions/widget_ext.dart';
import 'package:todaily/core/resources/color_res.dart';
import 'package:todaily/core/resources/edge_insets_res.dart';

class AddTodoPage extends StatelessWidget {
  static const String path = '/AddTodoPage';

  static route() => MaterialPageRoute(
        builder: (_) => const AddTodoPage(),
      );

  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ColorRes.TRANSPARENT,
        title: const Text(
          'Add New To Do',
        ),
        centerTitle: true,
      ),
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsetsRes.ALL16,
            child: Column(
              children: [
                Input(
                  controller: TextEditingController(),
                  hint: "Title",
                ).padding(bottom: 16),
                Input(
                  controller: TextEditingController(),
                  hint: "Description",
                  maxLines: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
