import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/account/domain/account_repository.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class LogoutUseCase extends UseCase<void, void> {
  final AccountRepository repository;

  LogoutUseCase(this.repository);

  @override
  Future<void> call(_) async => repository.logout();
}
