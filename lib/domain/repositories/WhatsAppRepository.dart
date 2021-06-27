import 'package:whatsappy/domain/models/NumberObject.dart';

abstract class WhatsAppRepository {
  Future<bool> openWhatsAppWithSingleMessage(NumberObject item);

  Future<bool> openWhatsAppWithOnlyMessageUseCase(NumberObject item);
}
