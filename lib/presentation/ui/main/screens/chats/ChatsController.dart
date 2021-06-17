import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_number/phone_number.dart';
import 'package:whatsappy/core/BaseController.dart';

class ChatsController extends GetxController {
  final BaseController controller = Get.find();

  test() {

    controller.runBlocking(data, onSuccess);

  }


  onSuccess(int data) {

    print("data is $data");

  }

  Future<int> data() async {
    await Future.delayed(Duration(seconds: 2), () {
      // 5s over, navigate to a new page
    });

    // throw Exception("df");

    return Future.value(100);
  }

  validateForm(GlobalKey<FormState> formKey) {
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      validateIsRealNumber("+201093518238", "EG")
          .then((value) => _validateAndSave(value));
    } else {
      _onValidateFailed();
    }
  }

  _onValidateFailed() {
    _onValidateFailed();
  }

  _validateAndSave(bool value) {
    if (value) {
      //navigate to whatsapp
      //todo
    } else {
      _onValidateFailed();
    }
  }

  Future validateIsRealNumber(String number, String code) async {
    try {
      PhoneNumberUtil plugin = PhoneNumberUtil();
      PhoneNumber phoneNumber = await PhoneNumberUtil().parse(number);
      return await plugin.validate(phoneNumber.international, code);
    } catch (e) {
      return false;
    }
  }


}
