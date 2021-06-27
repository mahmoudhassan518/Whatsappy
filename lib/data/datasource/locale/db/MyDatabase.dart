import 'dart:async';
import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:whatsappy/data/mapper/ChatsEntityMapper.dart';
import 'package:whatsappy/data/mapper/LinksEntityMapper.dart';
import 'package:whatsappy/data/mapper/TemplatesEntityMapper.dart';
import 'package:whatsappy/data/model/entites/ChatsEntity.dart';
import 'package:whatsappy/data/model/entites/LinksEntity.dart';
import 'package:whatsappy/data/model/entites/TemplatesEntity.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';

part 'MyDatabase.g.dart';

@UseMoor(tables: [ChatsEntity, TemplatesEntity, LinksEntity])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // loads all numbers entries
  Future<List<ChatsEntityData>> get allChats => select(chatsEntity).get();

  // watches all numbers entries. The stream will automatically
  // emit new items whenever the underlying data changes.
  Stream<List<NumberObject>> watchChatHistory(ChatsEntityMapper entityMapper) {
    final query = select(chatsEntity);

    return query.watch().map((event) {
      return event.map((e) => entityMapper.mapToDomainModel(e)).toList();
    });
  }

  // returns the generated id
  Future<int> addChat(ChatsEntityData entry) {
    return into(chatsEntity).insertOnConflictUpdate(entry);
  }

  Future clearChatsData() {
    // delete the oldest nine tasks
    return (delete(chatsEntity)).go();
  }

  Stream<List<NumberObject>> watchTemplatesHistory(
      TemplatesEntityMapper entityMapper) {
    final query = select(templatesEntity);

    return query.watch().map((event) {
      return event.map((e) => entityMapper.mapToDomainModel(e)).toList();
    });
  }

  // returns the generated id
  Future<int> addTemplate(TemplatesEntityData entry) {
    return into(templatesEntity).insert(TemplatesEntityCompanion(
        message: Value(entry.message),
        dateTimes: Value(entry.dateTimes),
        // id:  Value(entry.id),
        isNewTemplate: Value(entry.isNewTemplate)));
  }

  Future updateTemplate(TemplatesEntityData entry) =>
      update(templatesEntity).replace(entry);

  Future clearTemplatesData() {
    // delete the oldest nine tasks
    return (delete(templatesEntity)).go();
  }

  Stream<List<NumberObject>> watchLinksHistory(LinksEntityMapper entityMapper) {
    final query = select(linksEntity);

    return query.watch().map((event) {
      return event.map((e) => entityMapper.mapToDomainModel(e)).toList();
    });
  }

  // returns the generated id
  Future<int> addLink(LinksEntityData entry) {
    return into(linksEntity).insertOnConflictUpdate(entry);
  }

  Future clearLinksData() {
    // delete the oldest nine tasks
    return (delete(linksEntity)).go();
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
