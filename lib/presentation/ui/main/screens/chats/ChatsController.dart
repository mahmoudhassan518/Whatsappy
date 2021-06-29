import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_codes/country_codes.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_number/phone_number.dart';
import 'package:whatsappy/core/BaseController.dart';
import 'package:whatsappy/data/model/others/Constants.dart';
import 'package:whatsappy/data/model/others/NoParams.dart';
import 'package:whatsappy/di/Injector.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/domain/usecases/ClearChatHistoryFromDBUseCase.dart';
import 'package:whatsappy/domain/usecases/InsertChatHistoryToDBUseCase.dart';
import 'package:whatsappy/domain/usecases/OpenWhatsAppWithSingleNumberUseCase.dart';
import 'package:whatsappy/domain/usecases/ValidateIsRealNumberUseCase.dart';
import 'package:whatsappy/domain/usecases/WatchChatHistoryUseCase.dart';

class ChatsController extends GetxController {
  final BaseController controller = Get.find();

  ValidateIsRealNumberUseCase validateIsRealNumberUseCase =
      getIt<ValidateIsRealNumberUseCase>();

  OpenWhatsAppWithSingleNumberUseCase
      openWhatsAppWithSingleNumberNumberUseCase =
      getIt<OpenWhatsAppWithSingleNumberUseCase>();

  InsertChatHistoryToDBUseCase insertChatHistoryToDBUseCase =
      getIt<InsertChatHistoryToDBUseCase>();

  WatchChatHistoryUseCase watchChatHistoryUseCase =
      getIt<WatchChatHistoryUseCase>();

  ClearChatHistoryFromDBUseCase clearChatHistoryFromDBUseCase =
      getIt<ClearChatHistoryFromDBUseCase>();

  late TextEditingController _textController;
  var item = NumberObject();
  var codes = {isoCode: "", dialCode: ""}.obs;

  initCountryCodes({bool fromLocale = true}) async {
    await CountryCodes.init();
    final CountryDetails details = CountryCodes.detailsForLocale();
    codes.value = {
      isoCode: details.alpha2Code ?? "",
      dialCode: details.dialCode ?? ""
    };
  }

  onTextChanged(String text) {
    _checkIfRealNumber(text);
  }

  _checkIfRealNumber(String text) => controller.runBlocking(
      validateIsRealNumberUseCase(text), _onCheckIfRealNumber);

  void _onCheckIfRealNumber(PhoneNumber? value) {
    if (value != null) {
      Country result =
          CountryPickerUtils.getCountryByPhoneCode(value.countryCode);

      item.isoCode = result.isoCode;
      item.number = value.e164;
      item.dateTime = item.getCurrentTime();
      item.dialCode = '+' + value.countryCode;
      codes.value = {isoCode: result.isoCode, dialCode: result.phoneCode};
      _textController.text = value.nationalNumber;
    }
  }

  validateForm() => _validateNumber(item.dialCode + _textController.text);

  _validateNumber<bool>(String number) => controller.runBlocking(
      validateIsRealNumberUseCase(number, isValidation: true),
      _validateAndOpen);

  _validateAndOpen(PhoneNumber? value) {
    _onCheckIfRealNumber(value);

    if (value != null) _launchWhatsApp(item);
  }

  void onCodeChange(CountryCode value) {
    item.isoCode = value.code.toString();
    item.dialCode = value.dialCode.toString();
  }

  _launchWhatsApp(NumberObject item) => controller.runBlocking(
      openWhatsAppWithSingleNumberNumberUseCase(item), _insertDataToDB(item));

  launchWhatsAppOnly(NumberObject item) => controller.runBlocking(
      openWhatsAppWithSingleNumberNumberUseCase(item), (data) {});

  _insertDataToDB(NumberObject item) {
    controller.runBlocking<int>(insertChatHistoryToDBUseCase(item), (data) {});
  }

  Stream<List<NumberObject>> watchChatList() =>
      watchChatHistoryUseCase(NoParams());

  clearData() => controller.runBlocking(
      clearChatHistoryFromDBUseCase(NoParams()),
      (data) => print("data deleted"));

  setTextEditingController(TextEditingController textController) {
    this._textController = textController;
  }
}