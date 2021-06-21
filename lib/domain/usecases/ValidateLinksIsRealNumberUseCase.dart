import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/models/LinksHistory.dart';
import 'package:whatsappy/domain/repositories/ChatsRepository.dart';

class ValidateLinksIsRealNumberUseCase extends UseCase<Future<bool>, LinksHistory> {
  final ChatsRepository repository;

  ValidateLinksIsRealNumberUseCase(this.repository);

  @override
  Future<bool> call(LinksHistory params) =>
      repository.validateLinksIsRealNumber(params);
}
