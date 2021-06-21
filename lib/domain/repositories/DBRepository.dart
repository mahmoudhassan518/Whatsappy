import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/models/LinksHistory.dart';
import 'package:whatsappy/domain/models/TemplatesHistoryItem.dart';

abstract class DBRepository {
  Future<int> insertChatHistoryToDB(ChatsHistory item);

  Future<int> insertTemplateHistoryToDB(TemplatesHistory item);

  Future<int> insertLinksHistoryToDB(LinksHistory item);

  Future updateTemplateHistory(TemplatesHistory item);

  Stream<List<ChatsHistory>> watchChatHistory();

  Stream<List<TemplatesHistory>> watchTemplatesHistory();

  Stream<List<LinksHistory>> watchLinksHistory();

  Future clearChatHistoryFromDB();

  Future clearTemplateHistoryFromDB();

  Future clearLinksHistoryFromDB();

}
