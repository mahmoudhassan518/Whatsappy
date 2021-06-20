import 'package:whatsappy/domain/models/ChatsHistory.dart';

abstract class ChatsRepository {
  Future<bool> validateIsRealNumber(ChatsHistory item);

  Future<int> addChat(ChatsHistory item);

  Stream<List<ChatsHistory>> watchChat();

  Future clearData();

  Future openWhatsApp(ChatsHistory item);
}
