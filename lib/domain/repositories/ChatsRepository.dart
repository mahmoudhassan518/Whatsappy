import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/models/LinksHistory.dart';

abstract class ChatsRepository {
  Future<bool> validateChatIsRealNumber(ChatsHistory item);
  Future<bool> validateLinksIsRealNumber(LinksHistory item);

}
