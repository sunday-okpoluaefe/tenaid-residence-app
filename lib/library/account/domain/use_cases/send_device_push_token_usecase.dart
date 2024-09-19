import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/account/domain/account_repository.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class SendDevicePushTokenUseCase extends UseCase<String, void> {
  final AccountRepository repository;

  SendDevicePushTokenUseCase(this.repository);

  @override
  Future<void> call(String args) async => repository.sendDevicePushToken(args);
}
