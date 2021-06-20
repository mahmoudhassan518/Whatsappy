import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:whatsappy/data/mapper/ChatsEntityMapper.dart';
import 'package:whatsappy/data/model/entites/ChatsHistoryEntity.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';

part 'MyDatabase.g.dart';

@UseMoor(tables: [Chats])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // loads all numbers entries
  Future<List<Chat>> get allChats => select(chats).get();

  // watches all numbers entries. The stream will automatically
  // emit new items whenever the underlying data changes.
  Stream<List<ChatsHistory>> watchChat(ChatsEntityMapper entityMapper) {
    final query = select(chats);

    return query.watch().map((event) {

      return event.map((e) =>entityMapper.mapToDomainModel(e)).toList();
    });
  }

  // returns the generated id
  Future<int> addChat(Chat entry) {
    return into(chats).insertOnConflictUpdate(entry);
  }

  Future clearData() {
    // delete the oldest nine tasks
    return (delete(chats)).go();
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
