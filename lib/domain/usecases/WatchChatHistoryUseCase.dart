import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/data/model/others/NoParams.dart';
import 'package:whatsappy/data/repositories/DBRepositoryImpl.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/repositories/DBRepository.dart';

class WatchChatHistoryUseCase
    extends UseCase<Stream<List<ChatsHistory>>, NoParams> {
  DBRepository repository;

  WatchChatHistoryUseCase(this.repository);

  @override
  Stream<List<ChatsHistory>> call(NoParams param) => repository.watchChatHistory();
}
