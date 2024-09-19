import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/account/domain/account_repository.dart';
import 'package:tenaid_mobile/library/account/domain/entity/account_domain.dart';
import 'package:tenaid_mobile/library/account/domain/entity/update_profile_info_param.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class UpdateInfoUseCase extends UseCase<UpdateProfileInfoParam, AccountDomain> {
  final AccountRepository repository;

  UpdateInfoUseCase(this.repository);

  @override
  Future<AccountDomain> call(UpdateProfileInfoParam args) async =>
      repository.updateProfileInfo(args);
}
