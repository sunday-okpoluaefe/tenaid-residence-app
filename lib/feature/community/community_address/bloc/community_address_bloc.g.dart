// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_address_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CommunityAddressStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CommunityAddressState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommunityAddressState call({
    Country? selectedCountry,
    City? selectedCity,
    PlaceDomain? place,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCommunityAddressState.copyWith(...)`.
class _$CommunityAddressStateCWProxyImpl
    implements _$CommunityAddressStateCWProxy {
  const _$CommunityAddressStateCWProxyImpl(this._value);

  final CommunityAddressState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CommunityAddressState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommunityAddressState call({
    Object? selectedCountry = const $CopyWithPlaceholder(),
    Object? selectedCity = const $CopyWithPlaceholder(),
    Object? place = const $CopyWithPlaceholder(),
  }) {
    return CommunityAddressState(
      selectedCountry: selectedCountry == const $CopyWithPlaceholder()
          ? _value.selectedCountry
          // ignore: cast_nullable_to_non_nullable
          : selectedCountry as Country?,
      selectedCity: selectedCity == const $CopyWithPlaceholder()
          ? _value.selectedCity
          // ignore: cast_nullable_to_non_nullable
          : selectedCity as City?,
      place: place == const $CopyWithPlaceholder()
          ? _value.place
          // ignore: cast_nullable_to_non_nullable
          : place as PlaceDomain?,
    );
  }
}

extension $CommunityAddressStateCopyWith on CommunityAddressState {
  /// Returns a callable class that can be used as follows: `instanceOfCommunityAddressState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$CommunityAddressStateCWProxy get copyWith =>
      _$CommunityAddressStateCWProxyImpl(this);
}
