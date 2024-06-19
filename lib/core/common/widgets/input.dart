import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? type;
  final String? hint;
  final bool obscure;
  final bool isRequired;
  final Function(String? value)? validator;
  final Color? backgroundColor;

  const Input({
    super.key,
    required this.controller,
    this.type,
    this.hint,
    this.obscure = false,
    this.isRequired = true,
    this.validator,
    this.backgroundColor,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.type,
      obscureText: widget.obscure && obscure,
      validator: (value) {
        if (widget.isRequired) {
          if (value == null || value.isEmpty) {
            return 'This field cannot be empty';
          }
        }

        return widget.validator?.call(value);
      },
      decoration: InputDecoration(
        filled: widget.backgroundColor != null,
        fillColor: widget.backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: widget.hint,
        suffixIcon: !widget.obscure
            ? null
            : IconButton(
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                icon: Icon(
                  obscure ? Iconsax.eye : Iconsax.eye_slash,
                ),
              ),
      ),
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
