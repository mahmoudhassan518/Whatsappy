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
    _response.value = DataResponse.onError(error.toString());
  }

  runBlocking<T>(Future<T> block, Function(T data) onSuccessCallback) async {
    onLoading();
    try {
      T result = await block.whenComplete(() => idle());
      onSuccessCallback(result);

      print("result is $result");
    } on Exception catch (e) {
      print("Got error: $e"); // Finally, callback fires.
      onError(e);
    }
  }
}
