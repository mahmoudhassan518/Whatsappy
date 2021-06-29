import 'package:country_codes/country_codes.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_number/phone_number.dart';
import 'package:whatsappy/core/BaseController.dart';
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

  var country =
      Country(isoCode: 'us', name: '', iso3Code: '', phoneCode: '+1').obs;

  initCountryCodes({bool fromLocale = true}) async {
    await CountryCodes.init();
    final CountryDetails details = CountryCodes.detailsForLocale();

    country.value = Country(
        isoCode: details.alpha2Code ?? "",
        name: details.name ?? "",
        iso3Code: details.alpha3Code ?? "",
        phoneCode: details.dialCode ?? "");
  }

  onTextChanged(String text) {
    _checkIfRealNumber(text);
  }

  _checkIfRealNumber(String text) => controller.runBlocking(
      validateIsRealNumberUseCase(text), _onCheckIfRealNumber);

  void _onCheckIfRealNumber(PhoneNumber? value) {
    if (value != null) {
      setCountry(
          country: CountryPickerUtils.getCountryByPhoneCode(value.countryCode),
          phone: value);
    }
  }

  validateForm() => _validateNumber('+' + item.dialCode + _textController.text);

  _validateNumber<bool>(String number) => controller.runBlocking(
      validateIsRealNumberUseCase(number, isValidation: true),
      _validateAndOpen);

  _validateAndOpen(PhoneNumber? value) {
    _onCheckIfRealNumber(value);
    if (value != null) _launchWhatsApp(item);
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

  setCountry({required Country country, PhoneNumber? phone}) {
    Country newFormatCountry = Country(
        isoCode: country.isoCode,
        name: country.name,
        iso3Code: country.iso3Code,
        phoneCode: '+' + country.phoneCode);

    this.country.value = newFormatCountry;

    item.isoCode = newFormatCountry.isoCode;
    item.dialCode = newFormatCountry.phoneCode;
    item.dateTime = item.getCurrentTime();

    if (phone != null) {
      item.number = phone.e164;
      _textController.text = phone.nationalNumber;
    }
  }
}
