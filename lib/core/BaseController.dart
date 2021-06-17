import 'package:get/get.dart';

import 'DataResponse.dart';

class BaseController extends GetxController {
  var _response = DataResponse.init().obs;

  DataResponse get status => _response.value;

  idle() {
    _response.value = DataResponse.init();
  }

  onLoading({String? loadingMessage}) {
    _response.value = DataResponse.onLoading(loadingMessage);
  }

  onError(Exception error) {
    _response.value = DataResponse.onError(error);
  }

  // onSuccess<T>(T res) {
  //   _response.value = DataResponse.onSuccess(res);
  // }
  //
  // runBlocking<T>(
  //     Future<T> Function() function, Function(T data) onSuccess) async {
  //   onLoading();
  //   function.call().catchError((e) {
  //     print("Got error: $e"); // Finally, callback fires.
  //     onError(e); // Future completes with 42.
  //   }).then((value) {
  //     print("success $value");
  //     onSuccess.call(value);
  //   }).whenComplete(() => idle());
  // }
  //
  //



  runBlocking<T>(
      Future<T> Function() function, Function(T data) onSuccessCallback) async {
    onLoading();
    try {
      var r =  await function.call().whenComplete(() => idle());
      onSuccessCallback.call(r);

    } on Exception catch (e) {
      print("Got error: $e"); // Finally, callback fires.
      onError(e);
    }
  }


}
