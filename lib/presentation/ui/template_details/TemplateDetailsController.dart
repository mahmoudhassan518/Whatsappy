import 'package:get/get.dart';
import 'package:whatsappy/core/BaseController.dart';
import 'package:whatsappy/di/Injector.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/domain/usecases/InsertTemplateHistoryToDBUseCase.dart';
import 'package:whatsappy/domain/usecases/UpdateTemplateHistoryToDBUseCase.dart';
import 'package:whatsappy/presentation/utils/helper/helper.dart';

class TemplateDetailsController extends GetxController {
  final BaseController controller = Get.find();

  NumberObject item = NumberObject();

  void setTemplate(NumberObject item) {
    this.item = item;
  }

  InsertTemplateHistoryToDBUseCase insertTemplateHistoryToDBUseCase =
      getIt<InsertTemplateHistoryToDBUseCase>();

  UpdateTemplateHistoryToDBUseCase updateTemplateHistoryToDBUseCase =
      getIt<UpdateTemplateHistoryToDBUseCase>();

  void validateForm() {
    if (item.message .isEmpty) {
      showSnackBar(title: 'error'.tr, content: 'required'.tr);
      return;
    }

    item.dateTime = item.getCurrentTime();

    if (item.isNewTemplate) {
      item.isNewTemplate = false;

      _insert(item);
    } else
      _update(item);
  }

  _update(NumberObject item) => controller.runBlocking(
      updateTemplateHistoryToDBUseCase(item), (data) => _onUpdated());

  _insert(NumberObject item) => controller.runBlocking(
      insertTemplateHistoryToDBUseCase(item), (data) => _onInserted());

  _onSubmitDone() {
    print("done");
    Get.back();
  }

  _onUpdated() {
    _onSubmitDone();
  }

  _onInserted() {
    _onSubmitDone();
  }

  void onValueChanged(String value) {
    item.message = value;

  }
}
