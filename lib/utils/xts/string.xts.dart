extension EmailValidator on String {
  /// *
  /// Checks if a string is a valid email address
  bool get isValidEmail {
    return RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(this);
  }

  /// *
  /// Checks if a string is digits
  bool get isDigits {
    return RegExp(r'^\d+$').hasMatch(this);
  }

  /// *
  /// Checks if a string is boolean
  bool get isBoolean {
    return toLowerCase() == 'true' || toLowerCase() == 'false';
  }

  String get asCode {
    return '${substring(0, 4)}-${substring(4)}';
  }

  String get avatar {
    List<String> parts = trim().split(' ');
    if (parts.length > 1)
      return '${parts[0].substring(0, 1)}${parts[1].substring(0, 1)}'
          .toUpperCase();
    return parts[0].substring(0, 2).toUpperCase();
  }
}
