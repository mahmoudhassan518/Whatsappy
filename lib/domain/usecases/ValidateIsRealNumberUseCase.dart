import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/repositories/ChatsRepository.dart';

class ValidateIsRealNumberUseCase extends UseCase<Future<bool>, ChatsHistory> {
  final ChatsRepository repository;

  ValidateIsRealNumberUseCase(this.repository);

  @override
  Future<bool> call(ChatsHistory params) =>
      repository.validateIsRealNumber(params);
}
