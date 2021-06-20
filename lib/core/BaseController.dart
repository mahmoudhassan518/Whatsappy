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

  runBlocking<T>(Future<T> Function() block, Function(T data) onSuccessCallback) async {
    onLoading();
    try {
      var result =  await block.call().whenComplete(() => idle());
      onSuccessCallback(result);

    } on Exception catch (e) {
      print("Got error: $e"); // Finally, callback fires.
      onError(e);
    }
  }


}
