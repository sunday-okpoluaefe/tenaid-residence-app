import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/core/domain/cache.dart';

import 'otp.dart';

const String _PREF_VARIABLE_TOKEN = '_PREF_VARIABLE_TOKEN';
const int MAX_INTERVAL = 9;
const int MAX_VARIABLE = 99;

const int MEMBER_CODE_LENGTH = 4;
const int MAX_VARIABLE_LENGTH = 2;
const int MAX_TOTP_LENGTH = 7;

class Code {
  final String totp;
  final String user;

  Code({required this.totp, required this.user});

  factory Code.parse(String value) => Code(
      totp: value.substring(0, MAX_TOTP_LENGTH),
      user: value.substring(4, 4 + MEMBER_CODE_LENGTH));
}

@injectable
class TOTP {
  final Cache cache;

  TOTP(this.cache);

  Future<int> _getVariable() async {
    int variable = await cache.getInt(_PREF_VARIABLE_TOKEN, 0);

    variable += 1;
    if (variable > MAX_VARIABLE) variable = 0;

    await cache.set(_PREF_VARIABLE_TOKEN, variable);

    return variable;
  }

  String _shuffle(String code) {
    int mean = code.length ~/ 2;

    List<String> partEnd = code.substring(mean, code.length).split('');
    List<String> partStart = code.substring(0, mean).split('');

    List<String> merged = [];

    int startIndex = 0;
    int endIndex = 0;
    for (int i = 0; i < code.length; i++) {
      if (i % 2 == 0 || i == 0) {
        merged.add(partEnd[endIndex]);
        endIndex += 1;
      } else {
        merged.add(partStart[startIndex]);
        startIndex += 1;
      }
    }

    return merged.join('');
  }

// convert to customer base 26
  String _toBase26(int number) {
    String result = '';

    while (number > 0) {
      int remainder = number % 26;
      result = String.fromCharCode(65 + remainder) + result;
      number = number ~/ 26; // Integer division
    }

    return result;
  }

  Future<String> _variableIdentifier({int? variable}) async =>
      (variable == null ? await _getVariable() : variable)
          .toString()
          .padLeft(MAX_VARIABLE_LENGTH, '0');

  Future<String> generateHourOtp(
      {required String secret,
      required String code,
      required DateTime start,
      int? variable,
      required int hours}) async {
    // convert to seconds
    String variableIdentifier = await _variableIdentifier(variable: variable);

    String otp = OTP.generateTOTP(
        secretKey: '$variableIdentifier$secret',
        startTime: start,
        codeLength: MAX_TOTP_LENGTH);

    String accessCode =
        _shuffle('$otp${code.padLeft(MEMBER_CODE_LENGTH, '0')}');

    return _toBase26(int.parse(accessCode));
  }

  Future<String> generateDayOtp(
      {required String secret,
      required String code,
      required DateTime start,
      required DateTime end,
      int? variable}) async {
    // convert to seconds
    String variableIdentifier = await _variableIdentifier(variable: variable);

    String otp = OTP.generateTOTP(
        secretKey: '$variableIdentifier$secret',
        startTime: start,
        validationType: ValidationType.MULTI,
        codeLength: MAX_TOTP_LENGTH);

    String accessCode =
        _shuffle('$otp${code.padLeft(MEMBER_CODE_LENGTH, '0')}');

    return _toBase26(int.parse(accessCode));
  }

  Future<String> generateExitCode(
      {required String secret, required String code}) async {
    String variableIdentifier = await _variableIdentifier();

    String otp = OTP.generateTOTP(
        secretKey: '$variableIdentifier$secret',
        startTime: DateTime.now(),
        codeLength: MAX_TOTP_LENGTH);

    String accessCode =
        _shuffle('$otp${code.padLeft(MEMBER_CODE_LENGTH, '0')}');

    return _toBase26(int.parse(accessCode));
  }
}
