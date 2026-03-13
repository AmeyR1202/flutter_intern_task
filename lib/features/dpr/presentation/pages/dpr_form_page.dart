import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intern_task/core/theme/app_colors.dart';
import 'package:flutter_intern_task/features/dpr/presentation/widgets/date_picker_field.dart';
import 'package:flutter_intern_task/features/dpr/presentation/widgets/description_field.dart';
import 'package:flutter_intern_task/features/dpr/presentation/widgets/image_picker.dart';
import 'package:flutter_intern_task/features/dpr/presentation/widgets/project_drop_down.dart';
import 'package:flutter_intern_task/features/dpr/presentation/widgets/weather_dropdown.dart';
import 'package:flutter_intern_task/features/dpr/presentation/widgets/worker_count_field.dart';
import 'package:flutter_intern_task/features/project/domain/entities/entities.dart';
import 'package:image_picker/image_picker.dart';
import '../bloc/dpr_bloc.dart';
import '../bloc/dpr_event.dart';
import '../bloc/dpr_state.dart';
import '../widgets/submit_button.dart';

class DprFormPage extends StatefulWidget {
  final List<ProjectEntity> projects;
  final ProjectEntity project;

  const DprFormPage({super.key, required this.project, required this.projects});

  @override
  State<DprFormPage> createState() => _DprFormPageState();
}

class _DprFormPageState extends State<DprFormPage> {
  String? selectedProject;
  String? selectedWeather;
  DateTime? selectedDate;

  final descriptionController = TextEditingController();
  final workerController = TextEditingController();

  final List<XFile> images = [];

  @override
  void initState() {
    super.initState();
    selectedProject = widget.project.id;
  }

  void submit() {
    context.read<DprBloc>().add(
      SubmitDpr(
        projectId: selectedProject,
        date: selectedDate,
        weather: selectedWeather,
        description: descriptionController.text,
        workerCount: workerController.text,
        images: images.map((e) => e.path).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DprBloc, DprState>(
      listener: (context, state) {
        if (state is DprSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("DPR submitted successfully")),
          );
          Navigator.pop(context);
        }

        if (state is DprFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text("Submit DPR - ${widget.project.name}"),
          backgroundColor: AppColors.background,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              ProjectDropdown(
                value: selectedProject,
                projects: widget.projects,
                onChanged: (v) {
                  setState(() {
                    selectedProject = v;
                  });
                },
              ),

              const SizedBox(height: 16),

              DatePickerField(onDateSelected: (d) => selectedDate = d),

              const SizedBox(height: 16),

              WeatherDropdown(onChanged: (v) => selectedWeather = v),

              const SizedBox(height: 16),

              DescriptionField(controller: descriptionController),

              const SizedBox(height: 16),

              WorkerCountField(controller: workerController),

              const SizedBox(height: 16),

              ImagePickerSection(images: images),

              const SizedBox(height: 24),

              SubmitButton(onPressed: submit),
            ],
          ),
        ),
      ),
    );
  }
}
