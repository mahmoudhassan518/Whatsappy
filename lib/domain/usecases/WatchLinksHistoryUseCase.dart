import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/data/model/others/NoParams.dart';
import 'package:whatsappy/data/repositories/DBRepositoryImpl.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/models/LinksHistory.dart';
import 'package:whatsappy/domain/repositories/DBRepository.dart';

class WatchLinksHistoryUseCase
    extends UseCase<Stream<List<LinksHistory>>, NoParams> {
  DBRepository repository;

  WatchLinksHistoryUseCase(this.repository);

  @override
  Stream<List<LinksHistory>> call(NoParams param) => repository.watchLinksHistory();
}
