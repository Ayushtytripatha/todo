import 'package:todo/features/domain/entities/task_entity.dart';
import 'package:todo/features/domain/repositories/local_repository.dart';

class UpdateUseCase {
  final LocalRepository localRepository;

  UpdateUseCase({this.localRepository});
  Future<void> call(TaskEntity task) {
    return localRepository.updateTask(task);
  }
}
