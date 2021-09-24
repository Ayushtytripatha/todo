import 'package:todo/features/domain/repositories/local_repository.dart';

class InitNotificationUseCase {
  final LocalRepository localRepository;

  InitNotificationUseCase({this.localRepository});

  Future<void> call() {
    return localRepository.initNotification();
  }
}
