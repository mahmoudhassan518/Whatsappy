import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/data/model/others/NoParams.dart';
import 'package:whatsappy/data/repositories/DBRepositoryImpl.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/repositories/DBRepository.dart';

class ClearChatHistoryFromDBUseCase extends UseCase<Future, NoParams> {
  DBRepository repository;

  ClearChatHistoryFromDBUseCase(this.repository);

  @override
  Future call(NoParams params) => repository.clearChatHistoryFromDB();
}
