import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/domain/repositories/WhatsAppRepository.dart';

class OpenWhatsAppWithOnlyMessageUseCase
    extends UseCase<Future<bool>, NumberObject> {
  final WhatsAppRepository repository;

  OpenWhatsAppWithOnlyMessageUseCase(this.repository);

  @override
  Future<bool> call(NumberObject params) =>
      repository.openWhatsAppWithOnlyMessageUseCase(params);
}
