import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/domain/repositories/DBRepository.dart';

class UpdateTemplateHistoryToDBUseCase extends UseCase<Future, NumberObject> {
  DBRepository repository;

  UpdateTemplateHistoryToDBUseCase(this.repository);

  @override
  Future call(NumberObject params) => repository.updateTemplateHistory(params);
}
