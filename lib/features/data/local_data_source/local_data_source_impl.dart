import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:todo/features/data/local_data_source/local_data_source.dart';
import 'package:todo/features/data/models/task_model.dart';
import 'package:todo/features/domain/entities/task_entity.dart';
import 'package:path/path.dart';

const String MAP_STORE = "MAP_STORE_TASK";

class LocaldataSourceImpl implements LocaldataSource {
  Completer<Database> _dbopencompleter;

  Future<Database> get _db async => _dbopencompleter.future;
  final _taskStore = intMapStoreFactory.store(MAP_STORE);

  Future _initDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = await join(appDocumentDir.path, "task.db");
    final datbase = await databaseFactoryIo.openDatabase(dbPath);

    _dbopencompleter.complete(datbase);
  }

  @override
  Future<void> addNewTask(TaskEntity task) async {
    final newTask = TaskModel(
      colorIndex: task.colorIndex,
      title: task.title,
      isCompleteTask: task.isCompleteTask,
      isNotification: task.isNotification,
      tasktype: task.tasktype,
      time: task.time,
    ).tojson();
    _taskStore.add(await _db, newTask);
  }

  @override
  Future<void> deleteTask(TaskEntity task) async {
    final finder = Finder(filter: Filter.byKey(task.id));
    _taskStore.delete(await _db, finder: finder);
  }

  @override
  Future<List<TaskEntity>> getAllTasks() async {
    final finder = Finder(sortOrders: [SortOrder('id')]);
    final recordSnapshots = await _taskStore.find(
      await _db,
      finder: finder,
    );

    return recordSnapshots.map((task) {
      final taskData = TaskModel.fromJson(task.value);
      taskData.id = task.key;
      return taskData;
    }).toList();
  }

  @override
  Future<void> getNotification(TaskEntity task) {
    // TODO: implement getNotification
    throw UnimplementedError();
  }

  @override
  Future<Database> openDatabase() {
    if (_dbopencompleter == null) {
      _dbopencompleter = Completer();
      _initDatabase();
    }
    return _dbopencompleter.future;
  }

  @override
  Future<void> turnOnNotification(TaskEntity task) {
    // TODO: implement turnOnNotification
    throw UnimplementedError();
  }

  @override
  Future<void> updateTask(TaskEntity task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
