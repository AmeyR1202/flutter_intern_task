import 'package:flutter_intern_task/core/errors/failure.dart';
import 'package:flutter_intern_task/features/project/domain/entities/entities.dart';
import 'package:fpdart/fpdart.dart';

class ProjectLocalDatasources {
  Future<Either<Failure, List<ProjectEntity>>> getProjects() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      final projects = [
        ProjectEntity(
          id: "1",
          name: "Mumbai Metro 10",
          status: "Planning",
          startDate: DateTime(2026, 1, 10),
        ),
        ProjectEntity(
          id: "2",
          name: "Delhi-Mumbai Expressway",
          status: "Ongoing",
          startDate: DateTime(2026, 2, 5),
        ),
        ProjectEntity(
          id: "3",
          name: "Atal Setu",
          status: "Completed",
          startDate: DateTime(2026, 3, 1),
        ),
      ];

      return Right(projects);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
