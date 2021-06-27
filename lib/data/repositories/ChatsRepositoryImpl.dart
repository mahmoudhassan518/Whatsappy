import 'package:phone_number/phone_number.dart';
import 'package:whatsappy/data/mapper/ChatsEntityMapper.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/domain/repositories/ChatsRepository.dart';
import 'package:get/get.dart';


class ChatsRepositoryImpl extends ChatsRepository {
  ChatsEntityMapper entityMapper = ChatsEntityMapper();

  Exception throwValidationException(String msg) => Exception(msg);

  @override
  Future<bool> validateIsRealNumber(NumberObject item) async {
    try {
      PhoneNumberUtil plugin = PhoneNumberUtil();
      PhoneNumber phoneNumber = await PhoneNumberUtil().parse(item.fullNumber);
      return await plugin.validate(phoneNumber.international, item.countryCode);
    } catch (e) {
      throw throwValidationException('validNumberErrorMessage'.tr);
    }
  }
}
