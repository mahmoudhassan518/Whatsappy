import 'package:whatsappy/core/Mapper.dart';
import 'package:whatsappy/data/datasource/locale/db/MyDatabase.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';

class ChatsEntityMapper extends Mapper<Chat, ChatsHistory> {
  @override
  Chat mapFromDomainModel(ChatsHistory domain) => Chat(
      countryFlagUri: domain.countryFlagUri,
      countryName: domain.countryName,
      countryCode: domain.countryCode,
      countryDialCode: domain.countryDialCode,
      dateTimes: domain.dateTime,
      number: domain.number,
      fullNumber: domain.fullNumber);

  @override
  ChatsHistory mapToDomainModel(Chat chat) => ChatsHistory(
      countryFlagUri: chat.countryFlagUri,
      countryName: chat.countryName,
      countryCode: chat.countryCode,
      countryDialCode: chat.countryDialCode,
      dateTime: chat.dateTimes,
      number: chat.number,
      fullNumber: chat.fullNumber);

  List<ChatsHistory> mapToDomainList(List<Chat> list) =>
      list.map((e) => mapToDomainModel(e)).toList();

  List<Chat> mapFromDomainList(List<ChatsHistory> list) =>
      list.map((e) => mapFromDomainModel(e)).toList();
}
