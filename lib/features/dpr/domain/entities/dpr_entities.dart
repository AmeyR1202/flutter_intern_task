class DprEntity {
  final String projectId;
  final DateTime date;
  final String weather;
  final String description;
  final int workerCount;
  final List<String> images;

  const DprEntity({
    required this.projectId,
    required this.date,
    required this.weather,
    required this.description,
    required this.workerCount,
    required this.images,
  });
}
