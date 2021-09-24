import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

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
    if (task.isNotification == false) {
//show notification

      final datetime = DateTime.parse(task.time);
      final androidChannel = AndroidNotificationDetails(
        task.id.toString(),
        "Daily Task Notification",
        "daily task Notification",
        icon: "@mipmap/ic_launcher",
        largeIcon: DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
      );

      final iosChannel = IOSNotificationDetails();
      final notificationDetails = NotificationDetails(
        android: androidChannel,
        iOS: iosChannel,
      );
      flutterLocalNotificationsPlugin.showDailyAtTime(
        task.id,
        task.time,
        "its time for ${task.title}",
        Time(datetime.hour, datetime.minute, 0),
        notificationDetails,
      );
    } else {
      flutterLocalNotificationsPlugin.cancel(
        task.id,
      );
    }
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
  Future<void> turnOnNotification(TaskEntity task) async {
    final newTask = TaskModel(
      colorIndex: task.colorIndex,
      title: task.title,
      isCompleteTask: task.isCompleteTask,
      isNotification: task.isNotification == true ? false : true,
      tasktype: task.tasktype,
      time: task.time,
    ).tojson();

    final finder = Finder(filter: Filter.byKey(task.id));
    _taskStore.update(await _db, newTask, finder: finder);
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    final newTask = TaskModel(
      colorIndex: task.colorIndex,
      title: task.title,
      isCompleteTask: task.isCompleteTask == true ? false : true,
      isNotification: task.isNotification,
      tasktype: task.tasktype,
      time: task.time,
    ).tojson();

    final finder = Finder(filter: Filter.byKey(task.id));
    _taskStore.update(await _db, newTask, finder: finder);
  }

  @override
  Future<void> initNotification() async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);
    flutterLocalNotificationsPlugin.initialize(initSettings);
  }
}
