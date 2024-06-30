import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:todaily/core/common/widgets/backgrounds/gradient_background.dart';
import 'package:todaily/core/resources/color_res.dart';
import 'package:todaily/core/services/dependency_injection.dart';
import 'package:todaily/features/todo/presentation/widgets/todo_fab.dart';

import '../../blocs/todo/todo_bloc.dart';
import '../../widgets/date_list.dart';
import '../../widgets/todo_card.dart';
import '../../widgets/todo_page_app_bar.dart';

class Todos extends StatefulWidget {
  static const String path = '/TodoPage';

  static route() => MaterialPageRoute(
        builder: (_) => page(),
      );

  static page() => BlocProvider(
        create: (context) => sl<TodoBloc>(),
        child: const Todos(),
      );

  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  @override
  void initState() {
    context.read<TodoBloc>().add(GetTodosEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: true,
      appBar: const TodoPageAppBar(),
      floatingActionButton: const TodoFab(),
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              // const SafeArea(
              //   child: DateList(),
              // ),
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
                  child: BlocBuilder<TodoBloc, TodoState>(
                    builder: (context, state) {
                      if (state is TodoGetTodosSuccess) {
                        return MasonryGridView.count(
                          itemCount: state.todos.length,
                          padding: const EdgeInsets.all(16),
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          itemBuilder: (context, index) {
                            final todo = state.todos[index];
                            return TodoCard(
                              key: ValueKey<String>(todo.id),
                              todo: todo,
                            );
                          },
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
