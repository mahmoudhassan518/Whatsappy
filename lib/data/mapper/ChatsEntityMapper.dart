import 'package:whatsappy/core/Mapper.dart';
import 'package:whatsappy/data/datasource/locale/db/MyDatabase.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';

class ChatsEntityMapper extends Mapper<ChatsEntityData, NumberObject> {
  @override
  ChatsEntityData mapFromDomainModel(NumberObject domain) => ChatsEntityData(
      countryFlagUri: domain.countryFlagUri,
      countryName: domain.countryName,
      countryCode: domain.countryCode,
      countryDialCode: domain.countryDialCode,
      dateTimes: domain.dateTime,
      number: domain.number,
      fullNumber: domain.fullNumber);

  @override
  NumberObject mapToDomainModel(ChatsEntityData chat) => NumberObject(
      countryFlagUri: chat.countryFlagUri,
      countryName: chat.countryName,
      countryCode: chat.countryCode,
      countryDialCode: chat.countryDialCode,
      dateTime: chat.dateTimes,
      number: chat.number,
      fullNumber: chat.fullNumber);

  List<NumberObject> mapToDomainList(List<ChatsEntityData> list) =>
      list.map((e) => mapToDomainModel(e)).toList();

  List<ChatsEntityData> mapFromDomainList(List<NumberObject> list) =>
      list.map((e) => mapFromDomainModel(e)).toList();
}
