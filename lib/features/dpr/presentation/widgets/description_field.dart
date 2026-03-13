import 'package:flutter/material.dart';
import 'package:flutter_intern_task/core/theme/app_colors.dart';

class DescriptionField extends StatelessWidget {
  final TextEditingController controller;

  const DescriptionField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 4,
      decoration: const InputDecoration(
        labelText: "Work Description",
        labelStyle: TextStyle(color: AppColors.textPrimary),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Enter work description";
        }
        return null;
      },
    );
  }
}
