import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/domain/repositories/ChatsRepository.dart';

class ValidateIsRealNumberUseCase extends UseCase<Future<bool>, NumberObject> {
  final ChatsRepository repository;

  ValidateIsRealNumberUseCase(this.repository);

  @override
  Future<bool> call(NumberObject params) =>
      repository.validateIsRealNumber(params);
}
