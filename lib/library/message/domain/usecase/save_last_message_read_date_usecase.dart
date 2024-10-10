import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/message/domain/message_respository.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class SaveLastMessageReadDateUseCase extends UseCase<String?, void> {
  final MessageRepository repository;

  SaveLastMessageReadDateUseCase(this.repository);

  @override
  Future<void> call(String? args) async =>
      await repository.saveLastMessageDate(date: args);
}
