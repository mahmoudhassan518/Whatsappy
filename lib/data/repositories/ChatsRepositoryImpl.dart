import 'package:get/get.dart';
import 'package:phone_number/phone_number.dart';
import 'package:whatsappy/data/mapper/ChatsEntityMapper.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/domain/repositories/ChatsRepository.dart';

class ChatsRepositoryImpl extends ChatsRepository {
  ChatsEntityMapper entityMapper = ChatsEntityMapper();

  Exception throwValidationException(String msg) => Exception(msg);

  @override
  Future<PhoneNumber?> validateIsRealNumber(String number,
      {bool isValidation = false}) async {
    try {
      PhoneNumberUtil plugin = PhoneNumberUtil();
      return await plugin.parse(number);
    } catch (e) {
      if (isValidation)
        throw throwValidationException('validNumberErrorMessage'.tr);
      else
        return null;
    }
  }
}
