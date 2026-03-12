import 'package:flutter_intern_task/features/project/domain/entities/entities.dart';
import 'package:flutter_intern_task/features/project/domain/repositories/project_repository.dart';

class GetProjectUsecase {
  final ProjectRepository projectRepository;

  GetProjectUsecase(this.projectRepository);

  Future<List<ProjectEntity>> call() {
    return projectRepository.getProjects();
  }
}
