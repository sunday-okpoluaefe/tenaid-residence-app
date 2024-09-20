import 'package:tenaid_mobile/utils/country_utils/utils/city_utils.dart';
import 'package:tenaid_mobile/utils/country_utils/utils/country_utils.dart';
import 'package:tenaid_mobile/utils/country_utils/utils/state_utils.dart';

export './models/country.dart';
export './models/state.dart';
export './utils/city_utils.dart';
export './utils/country_utils.dart';

Future initCountryUtils() async {
  await loadCities();
  await loadCountries();
  //await loadStates();
}
