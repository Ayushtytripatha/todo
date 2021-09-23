import 'package:sembast/sembast.dart';
import 'package:todo/features/domain/entities/task_entity.dart';
import 'package:todo/features/domain/repositories/local_repository.dart';

class OpendatabaseUseCase {
  final LocalRepository localRepository;

  OpendatabaseUseCase({this.localRepository});
  Future<Database> call() {
    return localRepository.openDatabase();
  }
}
