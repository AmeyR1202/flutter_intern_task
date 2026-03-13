import 'package:flutter/material.dart';
import 'package:flutter_intern_task/core/theme/app_colors.dart';

class WorkerCountField extends StatelessWidget {
  final TextEditingController controller;

  const WorkerCountField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: "Worker Count",
        labelStyle: TextStyle(color: AppColors.textPrimary),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter worker count";
        }

        final number = int.parse(value);

        if (number <= 0) {
          return "Enter valid worker count";
        }

        return null;
      },
    );
  }
}
