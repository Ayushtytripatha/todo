import 'package:sembast/sembast.dart';
import 'package:todo/features/domain/entities/task_entity.dart';

abstract class LocalRepository {
  Future<void> addNewTask(TaskEntity task);
  Future<void> deleteTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<void> getNotification(TaskEntity task);
  Future<void> turnOnNotification(TaskEntity task);
  Future<List<TaskEntity>> getAllTasks();
  Future<void> initNotification();
  Future<Database> openDatabase();
}
