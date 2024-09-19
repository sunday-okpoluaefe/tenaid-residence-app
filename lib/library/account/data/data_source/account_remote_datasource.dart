import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart';
import 'package:tenaid_mobile/core/network/api.dart';
import 'package:tenaid_mobile/core/network/network_response.dart';
import 'package:tenaid_mobile/library/account/data/model/account.dart';
import 'package:tenaid_mobile/library/account/domain/entity/signup_param.dart';

import '../../domain/entity/update_profile_info_param.dart';
import '../model/auth_response.dart';

@Injectable()
class AccountRemoteDataSource {
  final Api api;

  AccountRemoteDataSource(this.api);

  /// login a registered account
  Future<AuthResponse> login(
      {required String username, required String password}) async {
    final body = <String, dynamic>{};
    body['username'] = username;
    body['password'] = password;

    Map<String, dynamic> response = (await api(
            url: 'auth/login', body: body, requestType: RequestType.post))
        .data;

    return AuthResponse.fromJson(response);
  }

  Future<Account> signup(SignUpParam params) async {
    final body = <String, dynamic>{};
    body['email'] = params.email.trim().toLowerCase();
    body['password'] = params.password;
    body['phone'] = params.phone;
    body['firstName'] = params.firstName;
    body['lastName'] = params.lastName;
    body['country'] = params.country.name;

    Map<String, dynamic> response =
        (await api(url: 'account', body: body, requestType: RequestType.post))
            .data;

    return Account.fromJson(response);
  }

  Future<Account> getAccount() async {
    NetworkResponse response =
        await api(url: 'account/me', requestType: RequestType.get);

    return Account.fromJson(response.data);
  }

  Future<void> changePassword(String password) async {
    final body = <String, dynamic>{};
    body['password'] = password;

    await api(
        url: 'account/change-password',
        body: body,
        requestType: RequestType.post);
  }

  Future<void> sendDevicePushToken(String token) async {
    final body = <String, dynamic>{};
    body['token'] = token;
    body['device'] = Platform.isAndroid ? 'android' : 'ios';
    await api(
        url: 'account/push-token', requestType: RequestType.post, body: body);
  }

  Future<void> logout() async {
    await api(url: 'auth/logout', requestType: RequestType.post);
  }

  Future<String> upload(String file) async {
    final String? name = lookupMimeType(file);
    FormData formData = FormData.fromMap(
        {'file': await MultipartFile.fromFile(file, filename: name)});

    NetworkResponse response = await api(
        url: 'file/upload/single',
        requestType: RequestType.post,
        body: formData);

    return response.data['url'];
  }

  Future<Account> updateProfileInfo(UpdateProfileInfoParam param) async {
    final body = <String, dynamic>{};
    body['dob'] = param.dob;
    body['phone'] = param.phone;
    body['photo'] = param.photo;
    body['firstName'] = param.firstName;
    body['lastName'] = param.lastName;
    body['country'] = param.country;

    NetworkResponse response = await api(
        url: 'account/info', requestType: RequestType.patch, body: body);

    return Account.fromJson(response.data);
  }
}
