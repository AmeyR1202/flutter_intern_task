import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intern_task/core/theme/app_colors.dart';
import 'package:flutter_intern_task/core/widgets/loader.dart';
import '../bloc/project_bloc.dart';
import '../bloc/project_event.dart';
import '../bloc/project_state.dart';
import '../widgets/project_card.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({super.key});

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProjectBloc>().add(FetchProjects());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Projects"),
        backgroundColor: AppColors.background,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, state) {
            if (state is ProjectLoading) {
              return const Loader();
            }

            if (state is ProjectLoadedSuccessfully) {
              return ListView.builder(
                itemCount: state.projects.length,
                itemBuilder: (context, index) {
                  final project = state.projects[index];

                  return ProjectCard(project: project, onTap: () {});
                },
              );
            }

            if (state is ProjectError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
