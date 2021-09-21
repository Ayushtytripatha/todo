import 'package:todo/features/domain/entities/task_entity.dart';
import 'package:todo/features/domain/repositories/local_repository.dart';

class AddTaskUseCase {
  final LocalRepository localRepository;

  AddTaskUseCase({this.localRepository});
  Future<void> call(TaskEntity task) {
    return localRepository.addNewTask(task);
  }
}
