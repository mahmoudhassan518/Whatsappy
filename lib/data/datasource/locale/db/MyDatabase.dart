import 'dart:async';
import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:whatsappy/data/mapper/ChatsEntityMapper.dart';
import 'package:whatsappy/data/mapper/LinksEntityMapper.dart';
import 'package:whatsappy/data/mapper/TemplatesEntityMapper.dart';
import 'package:whatsappy/data/model/entites/ChatsHistoryEntity.dart';
import 'package:whatsappy/data/model/entites/LinksHistoryEntity.dart';
import 'package:whatsappy/data/model/entites/TemplatesHistoryEntity.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/models/LinksHistory.dart';
import 'package:whatsappy/domain/models/TemplatesHistoryItem.dart';

part 'MyDatabase.g.dart';

@UseMoor(tables: [Chats, Templates, Links])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // loads all numbers entries
  Future<List<Chat>> get allChats => select(chats).get();

  // watches all numbers entries. The stream will automatically
  // emit new items whenever the underlying data changes.
  Stream<List<ChatsHistory>> watchChatHistory(ChatsEntityMapper entityMapper) {
    final query = select(chats);

    return query.watch().map((event) {
      return event.map((e) => entityMapper.mapToDomainModel(e)).toList();
    });
  }

  // returns the generated id
  Future<int> addChat(Chat entry) {
    return into(chats).insertOnConflictUpdate(entry);
  }

  Future clearChatsData() {
    // delete the oldest nine tasks
    return (delete(chats)).go();
  }

  Stream<List<TemplatesHistory>> watchTemplatesHistory(
      TemplatesEntityMapper entityMapper) {
    final query = select(templates);

    return query.watch().map((event) {
      return event.map((e) => entityMapper.mapToDomainModel(e)).toList();
    });
  }

  // returns the generated id
  Future<int> addTemplate(Template entry) {
    return into(templates).insert(TemplatesCompanion(
        message: Value(entry.message),
        dateTimes: Value(entry.dateTimes),
        // id:  Value(entry.id),
        isNewTemplate: Value(entry.isNewTemplate)));
  }

  Future updateTemplate(Template entry) => update(templates).replace(entry);

  Future clearTemplatesData() {
    // delete the oldest nine tasks
    return (delete(templates)).go();
  }

  Stream<List<LinksHistory>> watchLinksHistory(LinksEntityMapper entityMapper) {
    final query = select(links);

    return query.watch().map((event) {
      return event.map((e) => entityMapper.mapToDomainModel(e)).toList();
    });
  }

  // returns the generated id
  Future<int> addLink(Link entry) {
    return into(links).insertOnConflictUpdate(entry);
  }

  Future clearLinksData() {
    // delete the oldest nine tasks
    return (delete(links)).go();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}
