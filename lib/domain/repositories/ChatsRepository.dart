import 'package:whatsappy/domain/models/NumberObject.dart';

abstract class ChatsRepository {
  Future<bool> validateIsRealNumber(NumberObject item);
}
