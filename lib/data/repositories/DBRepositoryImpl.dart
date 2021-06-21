import 'package:whatsappy/data/datasource/locale/db/MyDatabase.dart';
import 'package:whatsappy/data/mapper/ChatsEntityMapper.dart';
import 'package:whatsappy/data/mapper/TemplatesEntityMapper.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/models/TemplatesHistoryItem.dart';
import 'package:whatsappy/domain/repositories/DBRepository.dart';

class DBRepositoryImpl extends DBRepository {
  MyDatabase db;

  DBRepositoryImpl(this.db);

  ChatsEntityMapper chatsEntityMapper = ChatsEntityMapper();
  TemplatesEntityMapper templatesEntityMapper = TemplatesEntityMapper();

  Exception throwValidationException(String msg) => Exception(msg);

  @override
  Stream<List<ChatsHistory>> watchChatHistory() =>
      db.watchChatHistory(chatsEntityMapper);

  @override
  Future<int> insertChatHistoryToDB(ChatsHistory item) =>
      db.addChat(chatsEntityMapper.mapFromDomainModel(item));

  @override
  Future clearChatHistoryFromDB() => db.clearChatsData();

  @override
  Stream<List<TemplatesHistory>> watchTemplatesHistory() =>
      db.watchTemplatesHistory(templatesEntityMapper);

  @override
  Future<int> insertTemplateHistoryToDB(TemplatesHistory item) =>
      db.addTemplate(templatesEntityMapper.mapFromDomainModel(item));


  @override
  Future clearTemplateHistoryFromDB() => db.clearTemplatesData();

  @override
  Future updateTemplateHistory(TemplatesHistory item) =>
      db.updateTemplate(templatesEntityMapper.mapFromDomainModel(item));
}
