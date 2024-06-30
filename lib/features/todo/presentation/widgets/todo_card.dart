import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todaily/core/resources/color_res.dart';
import 'package:todaily/core/utils/snack_bar_utils.dart';
import 'dart:math' as math;

import 'package:todaily/features/todo/domain/entities/todo_entity.dart';

class TodoCard extends StatelessWidget {
  final TodoEntity todo;

  const TodoCard({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    const List<Color> colors = [
      ColorRes.GREEN300,
      ColorRes.RED300,
      ColorRes.ORANGE300,
    ];
    final int priority = math.Random().nextInt(3);
    return GestureDetector(
      onLongPress: (){
        SnackBarUtils.showSnackBar(context, "${todo.id} uzun basildi");
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: DecoratedBox(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: colors[priority],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        todo.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const Divider(
                      color: ColorRes.BLACK,
                    ),
                    Text(
                      todo.description,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              child: SizedBox(
                height: 8,
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                    color: ColorRes.SLATE300,
                    shape: StadiumBorder(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
