import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todaily/core/resources/color_res.dart';
import 'package:todaily/features/todo/presentation/pages/add_todo_page.dart';

class TodoFab extends StatelessWidget {
  const TodoFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorRes.SKY300,
      child: const Center(
        child: Icon(Iconsax.add),
      ),
      onPressed: () {
        Navigator.of(context).push(AddTodoPage.route());
      },
    );
  }
}
