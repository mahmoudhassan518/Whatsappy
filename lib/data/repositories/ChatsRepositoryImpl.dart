import 'package:phone_number/phone_number.dart';
import 'package:whatsappy/data/mapper/ChatsEntityMapper.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/models/LinksHistory.dart';
import 'package:whatsappy/domain/repositories/ChatsRepository.dart';

class ChatsRepositoryImpl extends ChatsRepository {
  ChatsEntityMapper entityMapper = ChatsEntityMapper();

  @override
  Future<bool> validateChatIsRealNumber(ChatsHistory item) async {
    try {
      PhoneNumberUtil plugin = PhoneNumberUtil();
      PhoneNumber phoneNumber = await PhoneNumberUtil().parse(item.fullNumber);
      return await plugin.validate(phoneNumber.international, item.countryCode);
    } catch (e) {
      throw throwValidationException("Please enter a valid number");
    }
  }

  Exception throwValidationException(String msg) => Exception(msg);

  @override
  Future<bool> validateLinksIsRealNumber(LinksHistory item) async {
    try {
      PhoneNumberUtil plugin = PhoneNumberUtil();
      PhoneNumber phoneNumber = await PhoneNumberUtil().parse(item.fullNumber);
      return await plugin.validate(phoneNumber.international, item.countryCode);
    } catch (e) {
      throw throwValidationException("Please enter a valid number");
    }
  }
}
