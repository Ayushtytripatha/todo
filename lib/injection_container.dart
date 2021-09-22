import 'package:get_it/get_it.dart';
import 'package:todo/features/Presentation/cubit/task_cubit.dart';
import 'package:todo/features/data/local_data_source/local_data_source.dart';
import 'package:todo/features/data/repositories/local_repository_impl.dart';
import 'package:todo/features/domain/repositories/local_repository.dart';
import 'package:todo/features/domain/usecases/add_task_usecase.dart';
import 'package:todo/features/domain/usecases/delete_usecase.dart';
import 'package:todo/features/domain/usecases/get_all_tasks.dart';
import 'package:todo/features/domain/usecases/get_notification_usecase.dart';
import 'package:todo/features/domain/usecases/open_database_usecase.dart';
import 'package:todo/features/domain/usecases/trun_off_notification_usecase.dart';
import 'package:todo/features/domain/usecases/update_usecase.dart';
import 'features/data/local_data_source/local_data_source_impl.dart';

GetIt sl = GetIt.instance;
Future<void> init() async {
//bloc/cubit

  sl.registerFactory<TaskCubit>(() => TaskCubit(
        addTaskUseCase: sl.call(),
        deleteTaskUseCase: sl.call(),
        getAllTaskUseCase: sl.call(),
        getNotificatrionUseCase: sl.call(),
        opendatabaseUseCase: sl.call(),
        turnOnNotificationUseCase: sl.call(),
        updateUseCase: sl.call(),
      ));

//usecases
  sl.registerLazySingleton<AddTaskUseCase>(
      () => AddTaskUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<DeleteTaskUseCase>(
      () => DeleteTaskUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<GetAllTaskUseCase>(
      () => GetAllTaskUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<GetNotificatrionUseCase>(
      () => GetNotificatrionUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<OpendatabaseUseCase>(
      () => OpendatabaseUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<TurnOnNotificationUseCase>(
      () => TurnOnNotificationUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<UpdateUseCase>(
      () => UpdateUseCase(localRepository: sl.call()));

//repository

  sl.registerLazySingleton<LocalRepository>(
      () => LocalRepositoryImpl(localdataSource: sl.call()));
//remotDatasource
  sl.registerLazySingleton<LocaldataSource>(() => LocaldataSourceImpl());

//externals ex- firebasel
}
