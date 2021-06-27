import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/data/model/others/NoParams.dart';
import 'package:whatsappy/domain/repositories/DBRepository.dart';

class ClearTemplateHistoryFromDBUseCase extends UseCase<Future, NoParams> {
  DBRepository repository;

  ClearTemplateHistoryFromDBUseCase(this.repository);

  @override
  Future call(NoParams params) => repository.clearTemplateHistoryFromDB();
}
