import 'package:tenaid_mobile/library/account/data/model/account.dart';

class AuthResponse {
  final Account account;
  final String authorization;

  AuthResponse({required this.account, required this.authorization});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
      account: Account.fromJson(json['account']),
      authorization: json['authorization']);
}
