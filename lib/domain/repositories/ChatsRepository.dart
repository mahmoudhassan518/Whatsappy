import 'package:whatsappy/domain/models/ChatsHistory.dart';

abstract class ChatsRepository {
  Future<bool> validateIsRealNumber(ChatsHistory item);

}
