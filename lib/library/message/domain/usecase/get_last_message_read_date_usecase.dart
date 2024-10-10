import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/message/domain/message_respository.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class GetLastMessageReadDateUseCase extends UseCase<void, String> {
  final MessageRepository repository;

  GetLastMessageReadDateUseCase(this.repository);

  @override
  Future<String> call(_) async => await repository.getLastMessageDate();
}
