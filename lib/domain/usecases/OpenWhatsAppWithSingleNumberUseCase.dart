import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/data/repositories/WhatsAppRepositoryImpl.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/repositories/WhatsAppRepository.dart';

class OpenWhatsAppWithSingleNumberUseCase
    extends UseCase<Future<bool>, ChatsHistory> {
  final WhatsAppRepository repository;


  OpenWhatsAppWithSingleNumberUseCase(this.repository);


  @override
  Future<bool> call(ChatsHistory params) => repository.openWhatsAppWithSingleMessage(params);
}
