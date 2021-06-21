import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/data/repositories/DBRepositoryImpl.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/repositories/DBRepository.dart';

class InsertChatHistoryToDBUseCase extends UseCase<Future<int>, ChatsHistory> {
  DBRepository repository;

  InsertChatHistoryToDBUseCase(this.repository);


  @override
  Future<int> call(ChatsHistory params) => repository.insertChatHistoryToDB(params);
}
