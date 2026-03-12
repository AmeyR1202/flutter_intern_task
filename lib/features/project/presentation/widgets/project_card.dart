import 'package:flutter/material.dart';
import 'package:flutter_intern_task/features/project/domain/entities/entities.dart';
import 'package:intl/intl.dart';

class ProjectCard extends StatelessWidget {
  final ProjectEntity project;
  final VoidCallback onTap;

  const ProjectCard({super.key, required this.project, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat("dd MMM yyyy").format(project.startDate);

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(project.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Status: ${project.status}"),
            Text("Start Date: $formattedDate"),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
