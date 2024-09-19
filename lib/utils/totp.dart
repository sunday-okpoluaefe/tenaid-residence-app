import 'package:base32/base32.dart';
import 'package:injectable/injectable.dart';
import 'package:otp/otp.dart';
import 'package:tenaid_mobile/library/core/domain/cache.dart';

const String _PREF_VARIABLE_TOKEN = '_PREF_VARIABLE_TOKEN';
const int MAX_INTERVAL = 9;
const int MAX_VARIABLE = 9;

class Code {
  final String totp;
  final String user;
  final String variable;
  final String interval;

  Code(
      {required this.totp,
      required this.user,
      required this.variable,
      required this.interval});

  factory Code.parse(String value) => Code(
      totp: value.substring(0, 4),
      user: value.substring(4, 8),
      variable: value.substring(8, 9),
      interval: value.substring(9, 10));
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

  String shuffle(String code) {
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

  String reverse(String code) {
    String partA = '';
    String partB = '';

    for (int i = 0; i < code.length; i++) {
      if (i % 2 == 0 || i == 0) {
        partB += code.split('')[i];
      } else {
        partA += code.split('')[i];
      }
    }
    return '$partA$partB';
  }

  String _generate(
          {required String secret, required int time, required int steps}) =>
      OTP.generateTOTPCodeString(base32.encodeString(secret), time,
          interval: steps, algorithm: Algorithm.SHA512, length: 4);

  Future<String> generateHourOtp(
      {required String secret,
      required String code,
      required DateTime start,
      int? variable,
      required int hours}) async {
    // convert to seconds
    int steps = hours * 60 * 60;
    variable = variable == null ? await _getVariable() : variable;
    String otp = _generate(
        secret: '$variable$secret',
        time: start.toUtc().millisecondsSinceEpoch,
        steps: steps);
    return shuffle('$otp${code.padLeft(4, '0')}$variable${hours - 1}');
  }

  Future<String> generateDayOtp(
      {required String secret,
      required String code,
      required DateTime start,
      required DateTime end,
      int? variable}) async {
    // convert to seconds
    int days = end.difference(start).inDays;
    int steps = days * 24 * 60 * 60;
    variable = variable == null ? await _getVariable() : variable;
    String otp = _generate(
        secret: '$variable$secret',
        time: start.toUtc().millisecondsSinceEpoch,
        steps: steps);
    return shuffle('$otp${code.padLeft(4, '0')}$variable${days - 1}');
  }

  bool isValid(String secret, String otp) {
    String original = reverse(otp);
    Code code = Code.parse(original);
    int hrSteps = int.parse(code.interval) * 60 * 60;
    int daySteps = int.parse(code.interval) * 60 * 60 * 24;
    int time = DateTime.now().toUtc().millisecondsSinceEpoch;

    String hourTotp = _generate(
        secret: '${code.variable}$secret', time: time, steps: hrSteps);
    String dayTotp = _generate(
        secret: '${code.variable}$secret', time: time, steps: daySteps);

    return code.totp == hourTotp || code.totp == dayTotp;
  }
}
