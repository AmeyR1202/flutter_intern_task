import 'package:flutter_intern_task/core/errors/failure.dart';
import 'package:flutter_intern_task/features/project/data/datasources/project_local_datasources.dart';
import 'package:flutter_intern_task/features/project/domain/entities/entities.dart';
import 'package:flutter_intern_task/features/project/domain/repositories/project_repository.dart';
import 'package:fpdart/fpdart.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectLocalDatasources datasource;

  ProjectRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<ProjectEntity>>> getProjects() async {
    try {
      final result = await datasource.getProjects();
      return result;
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
