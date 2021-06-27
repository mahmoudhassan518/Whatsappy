import 'package:moor/moor.dart';

class TemplatesEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get message => text()();

  TextColumn get dateTimes => text()();

  BoolColumn get isNewTemplate => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}
