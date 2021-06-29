import 'package:moor/moor.dart';

class LinksEntity extends Table {
  TextColumn get dateTimes => text()();

  TextColumn get number => text()();

  TextColumn get isoCode => text()();

  TextColumn get dialCode => text()();

  @override
  Set<Column> get primaryKey => {number};
}
