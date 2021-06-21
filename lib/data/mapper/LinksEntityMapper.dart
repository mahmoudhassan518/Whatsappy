import 'package:whatsappy/core/Mapper.dart';
import 'package:whatsappy/data/datasource/locale/db/MyDatabase.dart';
import 'package:whatsappy/domain/models/LinksHistory.dart';

class LinksEntityMapper extends Mapper<Link, LinksHistory> {
  @override
  Link mapFromDomainModel(LinksHistory domain) => Link(
      countryFlagUri: domain.countryFlagUri,
      countryName: domain.countryName,
      countryCode: domain.countryCode,
      countryDialCode: domain.countryDialCode,
      dateTimes: domain.dateTime,
      number: domain.number,
      fullNumber: domain.fullNumber);

  @override
  LinksHistory mapToDomainModel(Link chat) => LinksHistory(
      countryFlagUri: chat.countryFlagUri,
      countryName: chat.countryName,
      countryCode: chat.countryCode,
      countryDialCode: chat.countryDialCode,
      dateTime: chat.dateTimes,
      number: chat.number,
      fullNumber: chat.fullNumber);

  List<LinksHistory> mapToDomainList(List<Link> list) =>
      list.map((e) => mapToDomainModel(e)).toList();

  List<Link> mapFromDomainList(List<LinksHistory> list) =>
      list.map((e) => mapFromDomainModel(e)).toList();
}
