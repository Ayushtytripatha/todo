import 'dart:convert';

import 'package:todo/features/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    int id,
    final String title,
    final String colorIndex,
    final String time,
    final String isNotification,
    final bool isCompleteTask,
    final String tasktype,
  }) : super(
          id: id,
          title: title,
          colorIndex: colorIndex,
          time: time,
          isNotification: isNotification,
          isCompleteTask: isCompleteTask,
          tasktype: tasktype,
        );

  static TaskModel fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'],
      isCompleteTask: json['isCompleteTask'],
      isNotification: json['isNotification'],
      time: json['time'],
      colorIndex: json['colorIndex'],
      tasktype: json['tasktype'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "title": title,
      "isCompleteTask": isCompleteTask,
      "isNotification": isNotification,
      "colorIndex": colorIndex,
      "time": time,
      "tasktype": tasktype,
    };
  }
}
