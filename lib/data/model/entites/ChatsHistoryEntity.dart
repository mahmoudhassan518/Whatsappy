import 'package:moor/moor.dart';


class Chats extends Table {
  TextColumn get countryFlagUri => text()();

  TextColumn get countryName => text()();

  TextColumn get countryCode => text()();

  TextColumn get countryDialCode => text()();

  TextColumn get dateTimes => text()();

  TextColumn get number => text()();

  TextColumn get fullNumber => text()();

  @override
  Set<Column> get primaryKey => {fullNumber};
}