import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

/// RFC4226/RFC6238 One-Time Password / Google Authenticator Library
class OTP {
  static const int chunkDurationInSeconds = 10 * 60; // 10 minutes
  static const int dayChunkDurationInSeconds = 60 * 60 * 24;

  static String generateTOTP(
      {required String secretKey,
      required DateTime startTime,
      ValidationType validationType = ValidationType.SINGLE,
      required int codeLength}) {
    // Calculate the number of 10-minute chunks since epoch
    int chunksSinceStartEpoch =
        (startTime.toUtc().millisecondsSinceEpoch ~/ 1000) ~/
            (validationType == ValidationType.SINGLE
                ? chunkDurationInSeconds
                : dayChunkDurationInSeconds);

    // Hash the chunk number to produce the TOTP
    Hmac hmac = Hmac(sha256, utf8.encode(secretKey));
    Digest hmacValue =
        hmac.convert(utf8.encode(chunksSinceStartEpoch.toString()));

    // Dynamic truncation to get the OTP value
    int truncatedValue = _dynamicTruncate(hmacValue.bytes);

    // Calculate the maximum value for the given code length (e.g., for 6 digits: 10^6 = 1,000,000)
    int maxValue = pow(10, codeLength).toInt();

    // Return the OTP, truncating it to the desired number of digits
    return (truncatedValue % maxValue).toString().padLeft(codeLength, '0');
  }

  static int _dynamicTruncate(List<int> hmacBytes) {
    // The offset is determined by the last 4 bits of the last byte
    int offset = hmacBytes.last & 0xf;

    // Extract 4 bytes starting at the offset and construct an integer
    int binary = ((hmacBytes[offset] & 0x7f) << 24) |
        ((hmacBytes[offset + 1] & 0xff) << 16) |
        ((hmacBytes[offset + 2] & 0xff) << 8) |
        (hmacBytes[offset + 3] & 0xff);

    // Return the dynamically truncated integer
    return binary;
  }

// Validates the TOTP without the future start time, only using current time, validity period, and code length
  ///
  /// Validates a TOTP
  /// @param secretKey: The enc key
  /// @param otp: The totp to be validated
  /// @param validationType: Whether single date or multi date validation
  /// @param codeLength: The length of the code
  static bool validateTOTP(
      {required String secretKey,
      required String otp,
      required int validity,
      ValidationType validationType = ValidationType.SINGLE}) {
    DateTime currentTime = DateTime.now();

    int validityInSeconds = validationType == ValidationType.SINGLE
        ? (validity * 60 * 60)
        : (validity * 60 * 60 * 24);

    // get total chunks in validity in seconds
    int validityChunksInSeconds = validityInSeconds ~/
        (validationType == ValidationType.SINGLE
            ? chunkDurationInSeconds
            : dayChunkDurationInSeconds);

    // Check the OTP for all valid chunks within the validity window
    for (int i = 0; i <= validityChunksInSeconds; i++) {
      String expectedOtp = generateTOTP(
          secretKey: secretKey,
          startTime: currentTime.subtract(Duration(
              seconds: (validationType == ValidationType.SINGLE
                      ? chunkDurationInSeconds
                      : dayChunkDurationInSeconds) *
                  i)),
          codeLength: otp.length);
      if (otp == expectedOtp) {
        return true; // Valid OTP within the time window
      }
    }
    return false; // OTP is invalid
  }
}

enum ValidationType {
  SINGLE,
  MULTI,
}
