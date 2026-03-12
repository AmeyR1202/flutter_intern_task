import 'package:flutter_intern_task/features/project/domain/entities/entities.dart';

class ProjectLocalDatasources {
  Future<List<ProjectEntity>> getProjects() async {
    await Future.delayed(Duration(milliseconds: 500));
    // fake data
    return [
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
  }
}
