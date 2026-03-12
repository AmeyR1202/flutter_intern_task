import 'package:flutter_intern_task/features/project/data/datasources/project_local_datasources.dart';
import 'package:flutter_intern_task/features/project/domain/entities/entities.dart';
import 'package:flutter_intern_task/features/project/domain/repositories/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectLocalDatasources datasource;

  ProjectRepositoryImpl(this.datasource);

  @override
  Future<List<ProjectEntity>> getProjects() async {
    return await datasource.getProjects();
  }
}
