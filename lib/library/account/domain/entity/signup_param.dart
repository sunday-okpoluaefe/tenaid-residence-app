import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../../utils/country_utils/models/country.dart';

part 'signup_param.g.dart';

@CopyWith(skipFields: true)
class SignUpParam {
  final String firstName;
  final String lastName;
  final Country country;
  final String phone;
  final String password;
  final String email;

  SignUpParam(
      {this.firstName = "",
      required this.country,
      this.lastName = "",
      this.phone = "",
      this.password = "",
      this.email = ""});
}
