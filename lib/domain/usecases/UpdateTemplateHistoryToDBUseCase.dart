import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/domain/models/TemplatesHistoryItem.dart';
import 'package:whatsappy/domain/repositories/DBRepository.dart';

class UpdateTemplateHistoryToDBUseCase
    extends UseCase<Future, TemplatesHistory> {
  DBRepository repository;

  UpdateTemplateHistoryToDBUseCase(this.repository);

  @override
  Future call(TemplatesHistory params) =>
      repository.updateTemplateHistory(params);
}
