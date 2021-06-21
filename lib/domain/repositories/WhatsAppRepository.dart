import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/models/TemplatesHistoryItem.dart';

abstract class WhatsAppRepository {
  Future<bool> openWhatsAppWithSingleMessage(ChatsHistory item);

  Future<bool> openWhatsAppWithOnlyMessageUseCase(TemplatesHistory item);
}
