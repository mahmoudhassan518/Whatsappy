import 'package:country_codes/country_codes.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:phone_number/phone_number.dart';
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

  late TextEditingController _textController;
  var item = NumberObject();

  var generatedLink = "".obs;

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
    checkIfRealNumber(text);
  }

  void checkIfRealNumber(String text) => controller.runBlocking(
      validateIsRealNumberUseCase(text), _onCheckIfRealNumber);

  void _onCheckIfRealNumber(PhoneNumber? value) {
    if (value != null) {
      setCountry(country: CountryPickerUtils.getCountryByPhoneCode(value.countryCode), phone: value);
    }
  }

  validateForm() => _validateNumber(item.dialCode + _textController.text);

  _validateNumber<bool>(String number) => controller.runBlocking(
      validateIsRealNumberUseCase(number, isValidation: true),
      _validateAndOpen);

  _validateAndOpen(PhoneNumber? value) {
    _onCheckIfRealNumber(value);

    if (value != null) {
      generatedLink.value = 'https://wa.me/' + item.number;
      _insertDataToDB(item);
    }
  }

  _insertDataToDB(NumberObject item) =>
      controller.runBlocking(insertLinkHistoryToDBUseCase(item), (data) {});

  Stream<List<NumberObject>> watchLinkList() =>
      watchLinksHistoryUseCase(NoParams());

  clearData() => controller.runBlocking(
      clearLinksHistoryFromDBUseCase(NoParams()),
      (data) => print("data deleted"));

  copySharedLink() {
    showSnackBar(title: "Copied!", content: generatedLink.value);
    Clipboard.setData(ClipboardData(text: generatedLink.value));
  }

  shareLink(String number) async {
    await Share.share(generatedLink.value);
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

  setTextEditingController(TextEditingController textController) {
    this._textController = textController;
  }
}
