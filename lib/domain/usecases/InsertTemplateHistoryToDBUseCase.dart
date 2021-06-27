import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/domain/repositories/DBRepository.dart';

class InsertTemplateHistoryToDBUseCase
    extends UseCase<Future<int>, NumberObject> {
  DBRepository repository;

  InsertTemplateHistoryToDBUseCase(this.repository);

  @override
  Future<int> call(NumberObject params) =>
      repository.insertTemplateHistoryToDB(params);
}
