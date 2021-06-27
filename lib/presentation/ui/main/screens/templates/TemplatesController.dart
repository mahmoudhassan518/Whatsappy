import 'package:get/get.dart';
import 'package:whatsappy/core/BaseController.dart';
import 'package:whatsappy/data/model/others/NoParams.dart';
import 'package:whatsappy/di/Injector.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/domain/usecases/ClearTemplateHistoryFromDBUseCase.dart';
import 'package:whatsappy/domain/usecases/OpenWhatsAppWithOnlyMessageUseCase.dart';
import 'package:whatsappy/domain/usecases/WatchTemplatesHistoryUseCase.dart';

class TemplatesController extends GetxController {
  final BaseController controller = Get.find();

  WatchTemplatesHistoryUseCase watchTemplatesHistoryUseCase =
      getIt<WatchTemplatesHistoryUseCase>();

  OpenWhatsAppWithOnlyMessageUseCase openWhatsAppWithOnlyMessageUseCase =
      getIt<OpenWhatsAppWithOnlyMessageUseCase>();

  ClearTemplateHistoryFromDBUseCase clearTemplateHistoryFromDBUseCase =
      getIt<ClearTemplateHistoryFromDBUseCase>();

  Stream<List<NumberObject>> watchTemplatesList() =>
      watchTemplatesHistoryUseCase(NoParams());

  launchWhatsApp(NumberObject item) {
    controller.runBlocking<bool>(openWhatsAppWithOnlyMessageUseCase(item),
        (data) => _onLaunchWhatsApp(data));
  }

  _onLaunchWhatsApp(bool data) {}

  clearData() => controller.runBlocking(
      clearTemplateHistoryFromDBUseCase(NoParams()),
      (data) => print("data deleted"));
}
