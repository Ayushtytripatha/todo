import 'package:todo/features/domain/entities/task_entity.dart';
import 'package:todo/features/domain/repositories/local_repository.dart';

class GetNotificatrionUseCase {
  final LocalRepository localRepository;

  GetNotificatrionUseCase({this.localRepository});
  Future<void> call(TaskEntity task) {
    return localRepository.getNotification(task);
  }
}
