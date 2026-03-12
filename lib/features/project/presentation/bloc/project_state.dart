import 'package:flutter_intern_task/features/project/domain/entities/entities.dart';

abstract class ProjectState {}

class ProjectInitial extends ProjectState {}

class ProjectLoading extends ProjectState {}

class ProjectLoadedSuccessfully extends ProjectState {
  final List<ProjectEntity> projects;

  ProjectLoadedSuccessfully(this.projects);
}

class ProjectError extends ProjectState {
  final String message;

  ProjectError(this.message);
}
