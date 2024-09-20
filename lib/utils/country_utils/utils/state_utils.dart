// import 'dart:convert';
//
// import 'package:flutter/services.dart' show rootBundle;
//
// import '../../../assets/assets.gen.dart';
// import '../models/state.dart';
//
// List<State> _states = [];
//
// Future loadStates() async {
//   final res = await rootBundle.loadString(Assets.json.state);
//   final data = jsonDecode(res) as List;
//   _states = List<State>.from(
//     data.map((item) => State.fromJson(item)),
//   );
// }
//
// /// Get world wide states list.
// List<State> getAllStates() => _states;
//
// /// Get the list of states that belongs to a country by the country ISO CODE
// List<State> getStatesOfCountry(String countryCode) {
//   final states = _states;
//
//   final res = states.where((state) {
//     return state.countryCode == countryCode;
//   }).toList();
//   res.sort((a, b) => a.name.compareTo(b.name));
//
//   return res;
// }
//
// /// Get a state from its code and its belonging country code
// State? getStateByCode(
//   String countryCode,
//   String stateCode,
// ) {
//   final states = _states;
//
//   final res = states.where((state) {
//     return state.countryCode == countryCode && state.isoCode == stateCode;
//   }).toList();
//
//   return res.isEmpty ? null : res.first;
// }
