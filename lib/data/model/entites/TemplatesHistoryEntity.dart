import 'package:moor/moor.dart';

class Templates extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get message => text()();

  TextColumn get dateTimes => text()();

  BoolColumn get isNewTemplate => boolean()();


  @override
  Set<Column> get primaryKey => {id};
}
