import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:todaily/core/common/widgets/backgrounds/gradient_background.dart';
import 'package:todaily/core/resources/color_res.dart';
import 'package:todaily/features/todo/presentation/widgets/todo_fab.dart';

import '../widgets/date_list.dart';
import '../widgets/todo_card.dart';
import '../widgets/todo_page_app_bar.dart';

class TodoPage extends StatelessWidget {
  static const String path = '/TodoPage';

  static route() => MaterialPageRoute(
        builder: (_) => const TodoPage(),
      );

  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const TodoPageAppBar(),
      floatingActionButton: const TodoFab(),
      body: GradientBackground(
        child: Column(
          children: [
            const SafeArea(
              child: DateList(),
            ),
            Expanded(
              child: DecoratedBox(
                decoration: const ShapeDecoration(
                  color: ColorRes.WHITE,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                ),
                child: MasonryGridView.count(
                  padding: const EdgeInsets.all(16),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return const TodoCard();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
