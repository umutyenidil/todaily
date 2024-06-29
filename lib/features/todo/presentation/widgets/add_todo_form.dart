import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todaily/core/common/widgets/button.dart';
import 'package:todaily/core/common/widgets/input.dart';
import 'package:todaily/core/extensions/widget_ext.dart';
import 'package:todaily/features/todo/presentation/blocs/todo/todo_bloc.dart';

class AddTodoForm extends StatefulWidget {
  const AddTodoForm({super.key});

  @override
  State<AddTodoForm> createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Input(
            controller: _titleController,
            hint: "Title",
          ).padding(bottom: 16),
          Input(
            controller: _descriptionController,
            hint: "Description",
            maxLines: 5,
          ).padding(bottom: 16),
          BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              return Button(
                isLoading: state is TodoLoading,
                text: "Add",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<TodoBloc>().add(
                          AddTodoEvent(
                            title: _titleController.text.trim(),
                            description: _descriptionController.text.trim(),
                          ),
                        );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
