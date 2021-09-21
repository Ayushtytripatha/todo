import 'package:todo/features/Presentation/cubit/task_cubit.dart';
import 'package:todo/features/domain/entities/task_entity.dart';
import 'package:todo/features/domain/repositories/local_repository.dart';

class GetAllTaskUseCase {
  final LocalRepository localRepository;

  GetAllTaskUseCase({this.localRepository});

  Future<List<TaskEntity>> call() {
    return localRepository.getAllTasks();
  }
}
