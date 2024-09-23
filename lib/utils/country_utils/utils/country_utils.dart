import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:tenaid_mobile/utils/xts/list_xt.dart';

import '../../../assets/assets.gen.dart';
import '../models/country.dart';

List<Country> _countries = [];

Future loadCountries() async {
  final res = await rootBundle.loadString(Assets.json.country);
  final data = jsonDecode(res) as List;
  _countries = List<Country>.from(
    data.map((item) => Country.fromJson(item)),
  );
}

/// Get world wide countries list.
List<Country> getAllCountries() => _countries;

/// Get country from its ISO CODE
Country? getCountryFromCode(String countryCode) {
  final cities = _countries;

  final res = cities.where((country) {
    return country.isoCode == countryCode;
  }).toList();
  res.sort((a, b) => a.name.compareTo(b.name));

  return res.isEmpty ? null : res.first;
}

// get country by name
Country? getCountryFromName(String? name) {
  if (name == null || name.isEmpty == true) return null;
  List<Country> countries = _countries;
  return countries.firstOrNullWhere((Country c) => c.name == name);
}
