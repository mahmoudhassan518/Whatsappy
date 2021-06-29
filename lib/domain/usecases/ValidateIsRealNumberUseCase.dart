import 'package:phone_number/phone_number.dart';
import 'package:whatsappy/core/UseCase.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/domain/repositories/ChatsRepository.dart';

class ValidateIsRealNumberUseCase extends UseCase<Future<PhoneNumber?>, String> {
  final ChatsRepository repository;

  ValidateIsRealNumberUseCase(this.repository);

  @override
  Future<PhoneNumber?> call(String params, {bool isValidation = false}) =>
      repository.validateIsRealNumber(params, isValidation: isValidation);
}
