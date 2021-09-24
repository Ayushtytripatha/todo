import 'dart:async';

import 'package:sembast/sembast.dart';
import 'package:todo/features/data/local_data_source/local_data_source.dart';
import 'package:todo/features/domain/entities/task_entity.dart';
import 'package:todo/features/domain/repositories/local_repository.dart';

class LocalRepositoryImpl implements LocalRepository {
  final LocaldataSource localdataSource;

  LocalRepositoryImpl({this.localdataSource});
  @override
  Future<void> addNewTask(TaskEntity task) async =>
      localdataSource.addNewTask(task);

  @override
  Future<void> deleteTask(TaskEntity task) async =>
      localdataSource.deleteTask(task);

  @override
  Future<List<TaskEntity>> getAllTasks() async => localdataSource.getAllTasks();

  @override
  Future<void> getNotification(TaskEntity task) async =>
      localdataSource.getNotification(task);

  @override
  Future<Database> openDatabase() async => localdataSource.openDatabase();

  @override
  Future<void> turnOnNotification(TaskEntity task) async =>
      localdataSource.turnOnNotification(task);

  @override
  Future<void> updateTask(TaskEntity task) async =>
      localdataSource.updateTask(task);

  @override
  Future<void> initNotification() async => localdataSource.initNotification();
}
