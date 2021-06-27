import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/data/model/others/NoParams.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/domain/repositories/DBRepository.dart';

class WatchLinksHistoryUseCase
    extends UseCase<Stream<List<NumberObject>>, NoParams> {
  DBRepository repository;

  WatchLinksHistoryUseCase(this.repository);

  @override
  Stream<List<NumberObject>> call(NoParams param) =>
      repository.watchLinksHistory();
}
