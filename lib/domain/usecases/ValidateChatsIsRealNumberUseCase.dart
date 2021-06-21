import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/repositories/ChatsRepository.dart';

class ValidateChatsIsRealNumberUseCase extends UseCase<Future<bool>, ChatsHistory> {
  final ChatsRepository repository;

  ValidateChatsIsRealNumberUseCase(this.repository);

  @override
  Future<bool> call(ChatsHistory params) =>
      repository.validateChatIsRealNumber(params);
}
