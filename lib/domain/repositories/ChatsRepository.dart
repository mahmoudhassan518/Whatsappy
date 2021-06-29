import 'package:phone_number/phone_number.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';

abstract class ChatsRepository {
  Future<PhoneNumber?> validateIsRealNumber(
      String number, {bool isValidation = false});

}
