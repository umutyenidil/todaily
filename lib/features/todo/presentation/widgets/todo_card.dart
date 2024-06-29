import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todaily/core/resources/color_res.dart';
import 'dart:math' as math;

class TodoCard extends StatelessWidget {
  const TodoCard({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Color> colors = [
      ColorRes.GREEN300,
      ColorRes.RED300,
      ColorRes.ORANGE300,
    ];
    final int priority = math.Random().nextInt(3);
    return Stack(
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
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Todo titlefasdfashdflkhasldkfhl",
                            style: TextStyle(fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                          },
                          icon: const Icon(
                            Iconsax.candle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: ColorRes.BLACK,
                  ),
                  Text(
                    "test" * math.Random().nextInt(100),
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 13),
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
    );
  }
}
