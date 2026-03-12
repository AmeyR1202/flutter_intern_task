import 'package:flutter_intern_task/features/project/domain/entities/entities.dart';

abstract class ProjectRepository {
  Future<List<ProjectEntity>> getProjects();
}
