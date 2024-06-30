import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todaily/core/common/providers/profile_provider.dart';
import 'package:todaily/core/common/widgets/button.dart';
import 'package:todaily/core/common/widgets/input.dart';
import 'package:todaily/core/extensions/widget_ext.dart';

import '../blocs/profile/profile_bloc.dart';

class UpdateProfileForm extends StatefulWidget {
  const UpdateProfileForm({super.key});

  @override
  State<UpdateProfileForm> createState() => _UpdateProfileFormState();
}

class _UpdateProfileFormState extends State<UpdateProfileForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _fullNameController;

  @override
  void initState() {
    super.initState();
    final profile = context.read<ProfileProvider>().profile;

    _fullNameController = TextEditingController(text: profile!.fullName);
  }

  @override
  void dispose() {
    _fullNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Input(
            isRequired: false,
            controller: _fullNameController,
            hint: "Full Name",
          ).padding(
            bottom: 16.0,
          ),
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return Button(
                isLoading: state is ProfileLoading,
                text: "Update",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<ProfileBloc>().add(
                          UpdateProfileEvent(
                            fullName:
                                _fullNameController.text.trim().isNotEmpty ? _fullNameController.text.trim() : null,
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
