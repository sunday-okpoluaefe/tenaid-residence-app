import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/account/domain/account_repository.dart';
import 'package:tenaid_mobile/library/account/domain/entity/account_domain.dart';

import '../../../../utils/use_case.dart';
import '../entity/login_param.dart';

@injectable
class LoginUseCase extends UseCase<LoginParam, AccountDomain> {
  final AccountRepository _accountRepository;

  LoginUseCase(this._accountRepository);

  @override
  Future<AccountDomain> call(LoginParam args) async {
    return await _accountRepository.login(
        username: args.username, password: args.password);
  }
}
