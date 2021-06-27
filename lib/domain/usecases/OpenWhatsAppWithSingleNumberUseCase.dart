import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/domain/repositories/WhatsAppRepository.dart';

class OpenWhatsAppWithSingleNumberUseCase
    extends UseCase<Future<bool>, NumberObject> {
  final WhatsAppRepository repository;

  OpenWhatsAppWithSingleNumberUseCase(this.repository);

  @override
  Future<bool> call(NumberObject params) =>
      repository.openWhatsAppWithSingleMessage(params);
}
