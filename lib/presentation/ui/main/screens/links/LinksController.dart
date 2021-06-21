import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:whatsappy/core/BaseController.dart';
import 'package:whatsappy/data/model/others/NoParams.dart';
import 'package:whatsappy/di/Injector.dart';
import 'package:whatsappy/domain/models/LinksHistory.dart';
import 'package:whatsappy/domain/usecases/ClearLinksHistoryFromDBUseCase.dart';
import 'package:whatsappy/domain/usecases/InsertLinksHistoryToDBUseCase.dart';
import 'package:whatsappy/domain/usecases/OpenWhatsAppWithSingleNumberUseCase.dart';
import 'package:whatsappy/domain/usecases/ValidateLinksIsRealNumberUseCase.dart';
import 'package:whatsappy/domain/usecases/WatchLinksHistoryUseCase.dart';
import 'package:flutter/services.dart';
import 'package:whatsappy/presentation/utils/helper/helper.dart';


class LinksController extends GetxController {


  var number = "".obs;

  final BaseController controller = Get.find();

  ValidateLinksIsRealNumberUseCase validateIsRealNumberUseCase =
      getIt<ValidateLinksIsRealNumberUseCase>();

  OpenWhatsAppWithSingleNumberUseCase
      openWhatsAppWithSingleNumberNumberUseCase =
      getIt<OpenWhatsAppWithSingleNumberUseCase>();

  InsertLinksHistoryToDBUseCase insertLinkHistoryToDBUseCase =
      getIt<InsertLinksHistoryToDBUseCase>();

  WatchLinksHistoryUseCase watchLinksHistoryUseCase =
      getIt<WatchLinksHistoryUseCase>();

  ClearLinksHistoryFromDBUseCase clearLinksHistoryFromDBUseCase =
      getIt<ClearLinksHistoryFromDBUseCase>();

  LinksHistory item = LinksHistory();

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

  validateIsRealNumber<bool>(LinksHistory item) => controller.runBlocking(
      validateIsRealNumberUseCase(item), _validateAndOpen);

  _validateAndOpen(bool value) {
    if (value) {
      //navigate to whatsapp

      number.value = 'https://wa.me/'+item.fullNumber;
      _insertDataToDB(value);
    }
  }

  _insertDataToDB(bool data) =>
      controller.runBlocking<int>(insertLinkHistoryToDBUseCase(item), (data) {
        //todo
      });

  Stream<List<LinksHistory>> watchLinkList() =>
      watchLinksHistoryUseCase(NoParams());

  clearData() => controller.runBlocking(
      clearLinksHistoryFromDBUseCase(NoParams()),
      (data) => print("data deleted"));

   copySharedLink() {

     showSnackBar(title: "Copied!", content: "Link is $number");
     Clipboard.setData(ClipboardData(text: number.value));

   }

  shareLink(String number) async{

   await Share.share(number);
  }

}
