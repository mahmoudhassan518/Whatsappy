import 'package:url_launcher/url_launcher.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/models/TemplatesHistoryItem.dart';
import 'package:whatsappy/domain/repositories/WhatsAppRepository.dart';

class WhatsAppRepositoryImpl extends WhatsAppRepository {
  Exception throwValidationException(String msg) => Exception(msg);

  @override
  Future<bool> openWhatsAppWithSingleMessage(ChatsHistory item) async {
    try {
      return await launch("https://wa.me/${item.fullNumber}?text=");
    } on Exception catch (e) {
      throw throwValidationException("Error during opening whatsapp!");
    }
  }

  @override
  Future<bool> openWhatsAppWithOnlyMessageUseCase(TemplatesHistory item) async {
    try {
      return await launch("https://wa.me/?text=${item.message}");
    } on Exception catch (e) {
      throw throwValidationException("Error during opening whatsapp!");
    }
  }
}
