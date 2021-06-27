import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/domain/repositories/DBRepository.dart';

class InsertLinksHistoryToDBUseCase extends UseCase<Future<int>, NumberObject> {
  DBRepository repository;

  InsertLinksHistoryToDBUseCase(this.repository);

  @override
  Future<int> call(NumberObject params) =>
      repository.insertLinksHistoryToDB(params);
}
