import 'package:phonecodes/phonecodes.dart';
import 'package:tenaid_mobile/library/account/domain/entity/country_domain.dart';

import '../../library/account/domain/entity/currency_domain.dart';

extension PhoneCodesCountryXts on Country {
  CountryDomain toDomain() => CountryDomain(
      name: name,
      code: code,
      dialCode: dialCode,
      flag: flag,
      currency: CurrencyDomain(
          name: currency.name, code: currency.code, symbol: currency.symbol));
}
