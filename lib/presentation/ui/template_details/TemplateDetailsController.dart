import 'package:get/get.dart';
import 'package:whatsappy/core/BaseController.dart';
import 'package:whatsappy/di/Injector.dart';
import 'package:whatsappy/domain/models/TemplatesHistoryItem.dart';
import 'package:whatsappy/domain/usecases/InsertTemplateHistoryToDBUseCase.dart';
import 'package:whatsappy/domain/usecases/UpdateTemplateHistoryToDBUseCase.dart';

class TemplateDetailsController extends GetxController {
  final BaseController controller = Get.find();

  TemplatesHistory item = TemplatesHistory();

  void setTemplate(TemplatesHistory item) {
    this.item = item;
  }

  InsertTemplateHistoryToDBUseCase insertTemplateHistoryToDBUseCase =
      getIt<InsertTemplateHistoryToDBUseCase>();

  UpdateTemplateHistoryToDBUseCase updateTemplateHistoryToDBUseCase =
      getIt<UpdateTemplateHistoryToDBUseCase>();

  void validateForm(String text) {
    item.message = text;

    item.dateTime = item.getCurrentTime();

    if (item.isNewTemplate) {
      item.isNewTemplate = false;

      _insert(item);
    } else
      _update(item);
  }

  _update(TemplatesHistory item) => controller.runBlocking(
      updateTemplateHistoryToDBUseCase(item), (data) => _onUpdated());

  _insert(TemplatesHistory item) => controller.runBlocking(
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
}
