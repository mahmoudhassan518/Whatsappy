import 'package:whatsappy/domain/models/NumberObject.dart';

abstract class DBRepository {
  Future<int> insertChatHistoryToDB(NumberObject item);

  Future<int> insertTemplateHistoryToDB(NumberObject item);

  Future<int> insertLinksHistoryToDB(NumberObject item);

  Future updateTemplateHistory(NumberObject item);

  Stream<List<NumberObject>> watchChatHistory();

  Stream<List<NumberObject>> watchTemplatesHistory();

  Stream<List<NumberObject>> watchLinksHistory();

  Future clearChatHistoryFromDB();

  Future clearTemplateHistoryFromDB();

  Future clearLinksHistoryFromDB();
}
