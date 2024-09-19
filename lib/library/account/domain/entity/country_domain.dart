import 'package:copy_with_extension/copy_with_extension.dart';

import 'currency_domain.dart';

part 'country_domain.g.dart';

@CopyWith(skipFields: true)
class CountryDomain {
  final String name;
  final String code;
  final String dialCode;
  final String flag;
  final CurrencyDomain currency;

  CountryDomain({required this.name, required this.code, required this.dialCode, required this.flag, required this.currency});
}
