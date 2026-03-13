import 'package:flutter_intern_task/core/errors/failure.dart';
import 'package:flutter_intern_task/features/project/domain/entities/entities.dart';
import 'package:flutter_intern_task/features/project/domain/repositories/project_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetProjectUsecase {
  final ProjectRepository projectRepository;

  GetProjectUsecase(this.projectRepository);

  Future<Either<Failure, List<ProjectEntity>>> call() {
    return projectRepository.getProjects();
  }
}
