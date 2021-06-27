import 'package:whatsappy/core/Mapper.dart';
import 'package:whatsappy/data/datasource/locale/db/MyDatabase.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';

class LinksEntityMapper extends Mapper<LinksEntityData, NumberObject> {
  @override
  LinksEntityData mapFromDomainModel(NumberObject domain) => LinksEntityData(
      countryFlagUri: domain.countryFlagUri,
      countryName: domain.countryName,
      countryCode: domain.countryCode,
      countryDialCode: domain.countryDialCode,
      dateTimes: domain.dateTime,
      number: domain.number,
      fullNumber: domain.fullNumber);

  @override
  NumberObject mapToDomainModel(LinksEntityData chat) => NumberObject(
      countryFlagUri: chat.countryFlagUri,
      countryName: chat.countryName,
      countryCode: chat.countryCode,
      countryDialCode: chat.countryDialCode,
      dateTime: chat.dateTimes,
      number: chat.number,
      fullNumber: chat.fullNumber);

  List<NumberObject> mapToDomainList(List<LinksEntityData> list) =>
      list.map((e) => mapToDomainModel(e)).toList();

  List<LinksEntityData> mapFromDomainList(List<NumberObject> list) =>
      list.map((e) => mapFromDomainModel(e)).toList();
}
