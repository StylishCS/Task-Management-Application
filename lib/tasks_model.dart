class ProjectModel {
  final String title;
  final String date;
  final String team;
  final String details;
  final String progress;
  final List<TaskModel> tasks;

  ProjectModel(
      {required this.title,
      required this.date,
      required this.team,
      required this.details,
      required this.progress,
      required this.tasks});
}

class TaskModel {
  final String taskName;
  bool isDone;

  TaskModel({required this.taskName, this.isDone = false});
}
