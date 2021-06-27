import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/domain/repositories/DBRepository.dart';

class InsertChatHistoryToDBUseCase extends UseCase<Future<int>, NumberObject> {
  DBRepository repository;

  InsertChatHistoryToDBUseCase(this.repository);

  @override
  Future<int> call(NumberObject params) =>
      repository.insertChatHistoryToDB(params);
}
