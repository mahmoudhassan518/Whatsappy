import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/models/TemplatesHistoryItem.dart';

abstract class DBRepository {
  Future<int> insertChatHistoryToDB(ChatsHistory item);

  Future<int> insertTemplateHistoryToDB(TemplatesHistory item);

  Future updateTemplateHistory(TemplatesHistory item);

  Stream<List<ChatsHistory>> watchChatHistory();

  Stream<List<TemplatesHistory>> watchTemplatesHistory();

  Future clearChatHistoryFromDB();

  Future clearTemplateHistoryFromDB();
}
