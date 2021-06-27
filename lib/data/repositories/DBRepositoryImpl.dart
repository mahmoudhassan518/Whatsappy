import 'package:whatsappy/data/datasource/locale/db/MyDatabase.dart';
import 'package:whatsappy/data/mapper/ChatsEntityMapper.dart';
import 'package:whatsappy/data/mapper/LinksEntityMapper.dart';
import 'package:whatsappy/data/mapper/TemplatesEntityMapper.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/domain/repositories/DBRepository.dart';

class DBRepositoryImpl extends DBRepository {
  MyDatabase db;

  DBRepositoryImpl(this.db);

  ChatsEntityMapper chatsEntityMapper = ChatsEntityMapper();
  TemplatesEntityMapper templatesEntityMapper = TemplatesEntityMapper();
  LinksEntityMapper linksEntityMapper = LinksEntityMapper();

  Exception throwValidationException(String msg) => Exception(msg);

  @override
  Stream<List<NumberObject>> watchChatHistory() =>
      db.watchChatHistory(chatsEntityMapper);

  @override
  Future<int> insertChatHistoryToDB(NumberObject item) =>
      db.addChat(chatsEntityMapper.mapFromDomainModel(item));

  @override
  Future clearChatHistoryFromDB() => db.clearChatsData();

  @override
  Stream<List<NumberObject>> watchTemplatesHistory() =>
      db.watchTemplatesHistory(templatesEntityMapper);

  @override
  Future<int> insertTemplateHistoryToDB(NumberObject item) =>
      db.addTemplate(templatesEntityMapper.mapFromDomainModel(item));

  @override
  Future clearTemplateHistoryFromDB() => db.clearTemplatesData();

  @override
  Future updateTemplateHistory(NumberObject item) =>
      db.updateTemplate(templatesEntityMapper.mapFromDomainModel(item));

  @override
  Future clearLinksHistoryFromDB() => db.clearLinksData();

  @override
  Future<int> insertLinksHistoryToDB(NumberObject item) =>
      db.addLink(linksEntityMapper.mapFromDomainModel(item));

  @override
  Stream<List<NumberObject>> watchLinksHistory() =>
      db.watchLinksHistory(linksEntityMapper);
}
