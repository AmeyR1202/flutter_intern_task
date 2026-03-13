abstract class DprEvent {}

class SubmitDpr extends DprEvent {
  final String? projectId;
  final DateTime? date;
  final String? weather;
  final String description;
  final String workerCount;
  final List<String> images;

  SubmitDpr({
    required this.projectId,
    required this.date,
    required this.weather,
    required this.description,
    required this.workerCount,
    required this.images,
  });
}
