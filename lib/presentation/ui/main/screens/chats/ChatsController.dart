import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get.dart';
import 'package:whatsappy/core/BaseController.dart';
import 'package:whatsappy/data/repositories/ChatsRepositoryImpl.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/repositories/ChatsRepository.dart';

class ChatsController extends GetxController {
  final BaseController controller = Get.find();
  final ChatsRepository _repository = ChatsRepositoryImpl();

  ChatsHistory item = ChatsHistory();

  void onCodeChange(CountryCode value) {
    print(value);

    item.countryCode = value.code ?? item.countryCode;
    item.countryName = value.name ?? item.countryName;
    item.countryFlagUri = value.flagUri ?? item.countryFlagUri;
    item.countryDialCode = value.dialCode ?? item.countryDialCode;

    print("data item is  ${item.toJson()}");
  }

  validateForm(String number) {
    item.number = number;
    item.fullNumber = item.countryDialCode + number;
    item.dateTime = item.getCurrentTime() ?? "";
    validateIsRealNumber(item);
  }

  validateIsRealNumber(ChatsHistory item) => controller.runBlocking(
      () => _repository.validateIsRealNumber(item), _validateAndOpen);

  _validateAndOpen(bool value) {
    if (value) {
      //navigate to whatsapp
      _launchWhatsApp();
    }
  }

  _launchWhatsApp() {
    controller.runBlocking(
        () => _repository.openWhatsApp(item), (data) => _insertDataToDB);
  }

  _insertDataToDB() {
    controller.runBlocking(() => _repository.addChat(item), (data) {});
  }

  Stream<List<ChatsHistory>> watchChatList() => _repository.watchChat();

  clearData() => controller.runBlocking(
      () => _repository.clearData(), (data) => print("data deleted"));
}
