import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get.dart';
import 'package:whatsappy/core/BaseController.dart';
import 'package:whatsappy/data/model/others/NoParams.dart';
import 'package:whatsappy/di/Injector.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/usecases/ClearChatHistoryFromDBUseCase.dart';
import 'package:whatsappy/domain/usecases/InsertChatHistoryToDBUseCase.dart';
import 'package:whatsappy/domain/usecases/OpenWhatsAppWithSingleNumberUseCase.dart';
import 'package:whatsappy/domain/usecases/ValidateChatsIsRealNumberUseCase.dart';
import 'package:whatsappy/domain/usecases/WatchChatHistoryUseCase.dart';

class ChatsController extends GetxController {
  final BaseController controller = Get.find();

  ValidateChatsIsRealNumberUseCase validateIsRealNumberUseCase =
      getIt<ValidateChatsIsRealNumberUseCase>();

  OpenWhatsAppWithSingleNumberUseCase
      openWhatsAppWithSingleNumberNumberUseCase =
      getIt<OpenWhatsAppWithSingleNumberUseCase>();

  InsertChatHistoryToDBUseCase insertChatHistoryToDBUseCase =
      getIt<InsertChatHistoryToDBUseCase>();

  WatchChatHistoryUseCase watchChatHistoryUseCase =
      getIt<WatchChatHistoryUseCase>();

  ClearChatHistoryFromDBUseCase clearChatHistoryFromDBUseCase =
      getIt<ClearChatHistoryFromDBUseCase>();

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

  validateIsRealNumber<bool>(ChatsHistory item) => controller.runBlocking(
      validateIsRealNumberUseCase(item), _validateAndOpen);

  _validateAndOpen(bool value) {
    if (value) {
      //navigate to whatsapp
      launchWhatsApp(item);
    }
  }

  launchWhatsApp(ChatsHistory item ) =>
    controller.runBlocking<bool>(
        openWhatsAppWithSingleNumberNumberUseCase(item),
        (data) => _insertDataToDB(data));


  launchWhatsAppThenSaveNumber(ChatsHistory item ) =>
      controller.runBlocking<bool>(
          openWhatsAppWithSingleNumberNumberUseCase(item),
              (data) {});


  _insertDataToDB(bool data) {
    controller.runBlocking<int>(insertChatHistoryToDBUseCase(item), (data) {});
  }

  Stream<List<ChatsHistory>> watchChatList() =>
      watchChatHistoryUseCase(NoParams());

  clearData() => controller.runBlocking(
      clearChatHistoryFromDBUseCase(NoParams()),
      (data) => print("data deleted"));
}
