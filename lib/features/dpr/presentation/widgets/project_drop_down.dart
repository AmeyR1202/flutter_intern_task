import 'package:flutter/material.dart';
import 'package:flutter_intern_task/core/theme/app_colors.dart';
import 'package:flutter_intern_task/features/project/domain/entities/entities.dart';

class ProjectDropdown extends StatelessWidget {
  final String? value;
  final List<ProjectEntity> projects;
  final Function(String?) onChanged;

  const ProjectDropdown({
    super.key,
    required this.value,
    required this.projects,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: "Project",
        labelStyle: TextStyle(color: AppColors.textPrimary),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      initialValue: value,
      items: projects
          .map((p) => DropdownMenuItem(value: p.id, child: Text(p.name)))
          .toList(),
      onChanged: onChanged,
      validator: (v) => v == null ? "Select project" : null,
    );
  }
}
