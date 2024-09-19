import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/account/domain/account_repository.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class IsLoginUseCase implements UseCase<bool, bool> {
  final AccountRepository _accountRepository;

  IsLoginUseCase(this._accountRepository);

  @override
  Future<bool> call(_) async {
    String token = await _accountRepository.getAuthorization();
    return token.isNotEmpty;
  }
}
