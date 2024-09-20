import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:tenaid_mobile/assets/assets.gen.dart';

import '../models/city.dart';

List<City> _cities = [];

Future loadCities() async {
  final res = await rootBundle.loadString(Assets.json.city);
  final data = jsonDecode(res) as List;
  _cities = List<City>.from(
    data.map((item) => City.fromJson(item)),
  );
}

/// Get world wide cities list.
List<City> getAllCities() => _cities;

/// Get the list of states that belongs to a state by the state ISO CODE and the country ISO CODE
Future<List<City>> getStateCities(String countryCode, String stateCode) async {
  final cities = _cities;

  final res = cities.where((city) {
    return city.countryCode == countryCode && city.stateCode == stateCode;
  }).toList();
  res.sort((a, b) => a.name.compareTo(b.name));

  return res;
}

/// Get the list of cities that belongs to a country by the country ISO CODE
List<City> getCountryCities(String countryCode) {
  final cities = _cities;

  final res = cities.where((city) {
    return city.countryCode == countryCode;
  }).toList();
  res.sort((a, b) => a.name.compareTo(b.name));

  return res;
}
