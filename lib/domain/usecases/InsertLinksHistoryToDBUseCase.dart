import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/domain/models/LinksHistory.dart';
import 'package:whatsappy/domain/repositories/DBRepository.dart';

class InsertLinksHistoryToDBUseCase extends UseCase<Future<int>, LinksHistory> {
  DBRepository repository;

  InsertLinksHistoryToDBUseCase(this.repository);

  @override
  Future<int> call(LinksHistory params) =>
      repository.insertLinksHistoryToDB(params);
}
