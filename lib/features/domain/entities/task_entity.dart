class TaskEntity {
  int id;
  final String title;
  final String colorIndex;
  final String time;
  final bool isNotification;
  final bool isCompleteTask;
  final String tasktype;

  TaskEntity(
      {this.title,
      this.colorIndex,
      this.time,
      this.isCompleteTask,
      this.isNotification,
      this.id,
      this.tasktype});
}
