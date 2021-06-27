import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:whatsappy/core/BaseController.dart';
import 'package:whatsappy/data/model/others/NoParams.dart';
import 'package:whatsappy/di/Injector.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/domain/usecases/ClearLinksHistoryFromDBUseCase.dart';
import 'package:whatsappy/domain/usecases/InsertLinksHistoryToDBUseCase.dart';
import 'package:whatsappy/domain/usecases/OpenWhatsAppWithSingleNumberUseCase.dart';
import 'package:whatsappy/domain/usecases/ValidateIsRealNumberUseCase.dart';
import 'package:whatsappy/domain/usecases/WatchLinksHistoryUseCase.dart';
import 'package:whatsappy/presentation/utils/helper/helper.dart';

class LinksController extends GetxController {
  var number = "".obs;

  final BaseController controller = Get.find();

  ValidateIsRealNumberUseCase validateIsRealNumberUseCase =
      getIt<ValidateIsRealNumberUseCase>();

  OpenWhatsAppWithSingleNumberUseCase
      openWhatsAppWithSingleNumberNumberUseCase =
      getIt<OpenWhatsAppWithSingleNumberUseCase>();

  InsertLinksHistoryToDBUseCase insertLinkHistoryToDBUseCase =
      getIt<InsertLinksHistoryToDBUseCase>();

  WatchLinksHistoryUseCase watchLinksHistoryUseCase =
      getIt<WatchLinksHistoryUseCase>();

  ClearLinksHistoryFromDBUseCase clearLinksHistoryFromDBUseCase =
      getIt<ClearLinksHistoryFromDBUseCase>();

  late NumberObject item = NumberObject();


  onTextChanged(String text) {
    item.number = text;
  }

  void onCodeChange(CountryCode value) {
    print(value);

    item.countryCode = value.code ?? item.countryCode;
    item.countryName = value.name ?? item.countryName;
    item.countryFlagUri = value.flagUri ?? item.countryFlagUri;
    item.countryDialCode = value.dialCode ?? item.countryDialCode;

    print("data item is  ${item.toJson()}");
  }

  validateForm() {
    print('number is ${item.number}');
    item.fullNumber = item.countryDialCode + item.number;
    item.dateTime = item.getCurrentTime();
    validateIsRealNumber(item);
  }

  validateIsRealNumber<bool>(NumberObject item) => controller.runBlocking(
      validateIsRealNumberUseCase(item), _validateAndOpen);

  _validateAndOpen(bool value) {
    if (value) {
      //navigate to whatsapp

      number.value = 'https://wa.me/' + item.fullNumber;
      _insertDataToDB(value);
    }
  }

  _insertDataToDB(bool data) =>
      controller.runBlocking<int>(insertLinkHistoryToDBUseCase(item), (data) {
        //todo
      });

  Stream<List<NumberObject>> watchLinkList() =>
      watchLinksHistoryUseCase(NoParams());

  clearData() => controller.runBlocking(
      clearLinksHistoryFromDBUseCase(NoParams()),
      (data) => print("data deleted"));

  copySharedLink() {
    showSnackBar(title: "Copied!", content: "Link is $number");
    Clipboard.setData(ClipboardData(text: number.value));
  }

  shareLink(String number) async {
    await Share.share(number);
  }
}
