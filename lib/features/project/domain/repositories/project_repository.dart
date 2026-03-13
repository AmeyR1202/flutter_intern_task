import 'package:flutter_intern_task/core/errors/failure.dart';
import 'package:flutter_intern_task/features/project/domain/entities/entities.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<ProjectEntity>>> getProjects();
}
