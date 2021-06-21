import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/data/model/others/NoParams.dart';
import 'package:whatsappy/data/repositories/DBRepositoryImpl.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/models/TemplatesHistoryItem.dart';
import 'package:whatsappy/domain/repositories/DBRepository.dart';

class WatchTemplatesHistoryUseCase
    extends UseCase<Stream<List<TemplatesHistory>>, NoParams> {
  DBRepository repository;

  WatchTemplatesHistoryUseCase(this.repository);

  @override
  Stream<List<TemplatesHistory>> call(NoParams param) => repository.watchTemplatesHistory();
}
