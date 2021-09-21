import 'package:todo/features/domain/entities/task_entity.dart';
import 'package:todo/features/domain/repositories/local_repository.dart';

class TurnOnNotificationUseCase {
  final LocalRepository localRepository;

  TurnOnNotificationUseCase({this.localRepository});
  Future<void> call(TaskEntity task) {
    return localRepository.turnOnNotification(task);
  }
}
