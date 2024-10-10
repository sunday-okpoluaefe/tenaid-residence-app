import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/account/domain/account_repository.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class GetAuthorizationUseCase implements UseCase<void, String> {
  final AccountRepository _accountRepository;

  GetAuthorizationUseCase(this._accountRepository);

  @override
  Future<String> call(_) async => await _accountRepository.getAuthorization();
}
