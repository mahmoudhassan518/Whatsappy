import 'package:phone_number/phone_number.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsappy/data/datasource/locale/db/MyDatabase.dart';
import 'package:whatsappy/data/mapper/ChatsEntityMapper.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/repositories/ChatsRepository.dart';

class ChatsRepositoryImpl extends ChatsRepository {
  MyDatabase db = new MyDatabase();
  ChatsEntityMapper entityMapper = ChatsEntityMapper();

  @override
  Future<bool> validateIsRealNumber(ChatsHistory item) async {
    try {
      PhoneNumberUtil plugin = PhoneNumberUtil();
      PhoneNumber phoneNumber = await PhoneNumberUtil().parse(item.fullNumber);
      return await plugin.validate(phoneNumber.international, item.countryCode);
    } catch (e) {
      throw throwValidationException("Please enter a valid number");
    }
  }

  Exception throwValidationException(String msg) =>
      Exception(msg);

  @override
  Stream<List<ChatsHistory>> watchChat() => db.watchChat(entityMapper);

  @override
  Future<int> addChat(ChatsHistory item) =>
      db.addChat(entityMapper.mapFromDomainModel(item));

  @override
  Future clearData() => db.clearData();

  @override
  Future openWhatsApp(ChatsHistory item) async{
    try {
      await launch("https://wa.me/${item.number}?text=");
    } on Exception catch(e) {
      throw throwValidationException("Error during opening whatsapp!");
    }
  }


}
