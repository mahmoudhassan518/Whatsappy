import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/domain/models/TemplatesHistoryItem.dart';
import 'package:whatsappy/domain/repositories/DBRepository.dart';

class InsertTemplateHistoryToDBUseCase
    extends UseCase<Future<int>, TemplatesHistory> {
  DBRepository repository;

  InsertTemplateHistoryToDBUseCase(this.repository);

  @override
  Future<int> call(TemplatesHistory params) =>
      repository.insertTemplateHistoryToDB(params);
}
