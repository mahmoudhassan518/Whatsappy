import 'package:whatsappy/core/Mapper.dart';
import 'package:whatsappy/data/datasource/locale/db/MyDatabase.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';

class ChatsEntityMapper extends Mapper<ChatsEntityData, NumberObject> {
  @override
  ChatsEntityData mapFromDomainModel(NumberObject domain) => ChatsEntityData(
      dateTimes: domain.dateTime,
      number: domain.number,
      isoCode: domain.isoCode,
      dialCode: domain.dialCode);

  @override
  NumberObject mapToDomainModel(ChatsEntityData chat) => NumberObject(
      dateTime: chat.dateTimes,
      number: chat.number,
      isoCode: chat.isoCode,
      dialCode: chat.dialCode);

  List<NumberObject> mapToDomainList(List<ChatsEntityData> list) =>
      list.map((e) => mapToDomainModel(e)).toList();

  List<ChatsEntityData> mapFromDomainList(List<NumberObject> list) =>
      list.map((e) => mapFromDomainModel(e)).toList();
}
