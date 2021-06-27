import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/data/model/others/NoParams.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/domain/repositories/DBRepository.dart';

class WatchTemplatesHistoryUseCase
    extends UseCase<Stream<List<NumberObject>>, NoParams> {
  DBRepository repository;

  WatchTemplatesHistoryUseCase(this.repository);

  @override
  Stream<List<NumberObject>> call(NoParams param) =>
      repository.watchTemplatesHistory();
}
