class TaskStatusCountModel {
  final String id;
  final int count;

  TaskStatusCountModel({
    required this.id,
    required this.count,
  });

  factory TaskStatusCountModel.fromJson(Map<String, dynamic> jsonData) {
    return TaskStatusCountModel(
      id: jsonData['_id'] ?? 'Unknown',
      count: jsonData['sum'] ?? 0,
    );
  }
}
