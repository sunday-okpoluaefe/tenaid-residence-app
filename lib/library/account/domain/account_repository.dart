import 'package:tenaid_mobile/library/account/domain/entity/signup_param.dart';

import '../../base/domain/base_repository.dart';
import 'entity/account_domain.dart';
import 'entity/update_profile_info_param.dart';

abstract class AccountRepository extends BaseRepository {
  Future<AccountDomain> login(
      {required String username, required String password});

  Future<void> logout();

  Future<void> changePassword(String password);

  Future<AccountDomain> signup(SignUpParam param);

  Future<AccountDomain> getAccount({bool refresh = false});

  Future<String> getAuthorization();

  Future<void> sendDevicePushToken(String token);

  Future<String> upload(String file);

  Future<AccountDomain> updateProfileInfo(UpdateProfileInfoParam param);
}
