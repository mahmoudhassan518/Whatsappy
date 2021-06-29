import 'package:whatsappy/core/Mapper.dart';
import 'package:whatsappy/data/datasource/locale/db/MyDatabase.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';

class LinksEntityMapper extends Mapper<LinksEntityData, NumberObject> {
  @override
  LinksEntityData mapFromDomainModel(NumberObject domain) => LinksEntityData(
      dateTimes: domain.dateTime,
      number: domain.number,
      isoCode: domain.isoCode,
      dialCode: domain.dialCode);

  @override
  NumberObject mapToDomainModel(LinksEntityData chat) => NumberObject(
      dateTime: chat.dateTimes,
      number: chat.number,
      isoCode: chat.isoCode,
      dialCode: chat.dialCode);

  List<NumberObject> mapToDomainList(List<LinksEntityData> list) =>
      list.map((e) => mapToDomainModel(e)).toList();

  List<LinksEntityData> mapFromDomainList(List<NumberObject> list) =>
      list.map((e) => mapFromDomainModel(e)).toList();
}
