import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/domain/models/TemplatesHistoryItem.dart';
import 'package:whatsappy/domain/repositories/WhatsAppRepository.dart';

class OpenWhatsAppWithOnlyMessageUseCase
    extends UseCase<Future<bool>, TemplatesHistory> {
  final WhatsAppRepository repository;

  OpenWhatsAppWithOnlyMessageUseCase(this.repository);

  @override
  Future<bool> call(TemplatesHistory params) =>
      repository.openWhatsAppWithOnlyMessageUseCase(params);
}
