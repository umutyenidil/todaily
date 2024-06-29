import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todaily/core/common/widgets/backgrounds/gradient_background.dart';
import 'package:todaily/core/resources/color_res.dart';
import 'package:todaily/core/resources/edge_insets_res.dart';
import 'package:todaily/core/services/dependency_injection.dart';
import 'package:todaily/core/utils/snack_bar_utils.dart';
import 'package:todaily/features/todo/presentation/widgets/add_todo_form.dart';

import '../../blocs/todo/todo_bloc.dart';

class AddTodoPage extends StatelessWidget {
  static const String path = '/AddTodoPage';

  static route() => MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => sl<TodoBloc>(),
          child: const AddTodoPage(),
        ),
      );

  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoBloc, TodoState>(
      listener: (context, state) {
        if (state is TodoError) {
          SnackBarUtils.showSnackBar(context, state.message);
        }
        if (state is TodoAddTodoSuccess) {
          SnackBarUtils.showSnackBar(context, "Todo has been added");
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: ColorRes.TRANSPARENT,
          title: const Text(
            'Add New To Do',
          ),
          centerTitle: true,
        ),
        body: const GradientBackground(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsetsRes.ALL16,
              child: AddTodoForm(),
            ),
          ),
        ),
      ),
    );
  }
}
