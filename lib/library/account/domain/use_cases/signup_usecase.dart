import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/account/domain/account_repository.dart';
import 'package:tenaid_mobile/library/account/domain/entity/account_domain.dart';
import 'package:tenaid_mobile/library/account/domain/entity/signup_param.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class SignUpUseCase extends UseCase<SignUpParam, AccountDomain> {
  final AccountRepository _accountRepository;

  SignUpUseCase(this._accountRepository);

  @override
  Future<AccountDomain> call(SignUpParam args) async {
    return await _accountRepository.signup(args);
  }
}
