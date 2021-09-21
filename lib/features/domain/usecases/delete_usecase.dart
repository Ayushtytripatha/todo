import 'package:todo/features/domain/entities/task_entity.dart';
import 'package:todo/features/domain/repositories/local_repository.dart';

class DeleteTaskUseCase {
  final LocalRepository localRepository;

  DeleteTaskUseCase({this.localRepository});
  Future<void> call(TaskEntity task) {
    return localRepository.deleteTask(task);
  }
}
