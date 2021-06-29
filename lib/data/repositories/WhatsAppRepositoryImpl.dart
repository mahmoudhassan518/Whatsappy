import 'package:url_launcher/url_launcher.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/domain/repositories/WhatsAppRepository.dart';
import 'package:get/get.dart';


class WhatsAppRepositoryImpl extends WhatsAppRepository {
  Exception throwValidationException(String msg) => Exception(msg);

  @override
  Future<bool> openWhatsAppWithSingleMessage(NumberObject item) async {
    try {
      return await launch("https://wa.me/${item.number}?text=");
    } on Exception {
      throw throwValidationException('openWhatsappErrorMessage'.tr);
    }
  }

  @override
  Future<bool> openWhatsAppWithOnlyMessageUseCase(NumberObject item) async {
    try {
      return await launch("https://wa.me/?text=${item.message}");
    } on Exception {
      throw throwValidationException('openWhatsappErrorMessage'.tr);
    }
  }
}
