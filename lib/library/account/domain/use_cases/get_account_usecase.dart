import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/account/domain/account_repository.dart';
import 'package:tenaid_mobile/library/account/domain/entity/account_domain.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class GetAccountUseCase extends UseCase<bool, AccountDomain> {
  final AccountRepository repository;

  GetAccountUseCase(this.repository);

  @override
  Future<AccountDomain> call(bool args) async =>
      repository.getAccount(refresh: args);
}
