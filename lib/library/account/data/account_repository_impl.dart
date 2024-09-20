import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/account/data/model/account.dart';
import 'package:tenaid_mobile/library/account/data/model/auth_response.dart';
import 'package:tenaid_mobile/library/account/domain/account_repository.dart';
import 'package:tenaid_mobile/library/account/domain/entity/signup_param.dart';
import 'package:tenaid_mobile/library/account/domain/entity/update_profile_info_param.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';

import '../../../core/network/api_error_parser.dart';
import '../domain/entity/account_domain.dart';
import 'data_source/account_local_datasource.dart';
import 'data_source/account_remote_datasource.dart';
import 'mapper/account_to_domain_mapper.dart';

@Injectable(as: AccountRepository)
class AccountRepositoryImpl implements AccountRepository {
  final AccountRemoteDataSource remoteDataSource;
  final AccountLocalDataSource _accountLocalDataSource;
  final CommunityRepository communityRepository;
  final AccountToDomainMapper accountToDomainMapper;

  AccountRepositoryImpl(this.accountToDomainMapper,
      this._accountLocalDataSource, this.communityRepository,
      {required this.remoteDataSource});

  @override
  Future<AccountDomain> login(
      {required String username, required String password}) async {
    AuthResponse response =
        await remoteDataSource.login(username: username, password: password);

    await _accountLocalDataSource.saveAuthorization(response.authorization);
    await _accountLocalDataSource.saveAccount(response.account);
    return accountToDomainMapper.map(response.account);
  }

  @override
  Future<AccountDomain> signup(SignUpParam param) async {
    Account account = await remoteDataSource.signup(param);
    return accountToDomainMapper.map(account);
  }

  @override
  Future<String> getAuthorization() async {
    return await _accountLocalDataSource.getAuthorization();
  }

  @override
  Future<AccountDomain> getAccount({bool refresh = false}) async {
    Account account = await _accountLocalDataSource.getAccount();

    if (!refresh) return accountToDomainMapper.map(account);

    try {
      account = await remoteDataSource.getAccount();
    } on ApiException catch (error) {
      if (error is! NetworkError) throw error;
    }

    await _accountLocalDataSource.saveAccount(account);
    return accountToDomainMapper.map(account);
  }

  @override
  Future<void> reset() => _accountLocalDataSource.reset();

  @override
  Future<void> logout() async {
    await remoteDataSource.logout();
    await reset();
    await communityRepository.reset();
  }

  @override
  Future<void> changePassword(String password) async =>
      await remoteDataSource.changePassword(password);

  @override
  Future<void> sendDevicePushToken(String token) async =>
      await remoteDataSource.sendDevicePushToken(token);

  @override
  Future<AccountDomain> updateProfileInfo(UpdateProfileInfoParam param) async {
    Account account = await remoteDataSource.updateProfileInfo(param);
    await _accountLocalDataSource.saveAccount(account);

    return accountToDomainMapper.map(account);
  }
}
