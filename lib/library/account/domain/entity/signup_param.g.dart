// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_param.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SignUpParamCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SignUpParam(...).copyWith(id: 12, name: "My name")
  /// ````
  SignUpParam call({
    String? firstName,
    Country? country,
    String? lastName,
    String? phone,
    String? password,
    String? email,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSignUpParam.copyWith(...)`.
class _$SignUpParamCWProxyImpl implements _$SignUpParamCWProxy {
  const _$SignUpParamCWProxyImpl(this._value);

  final SignUpParam _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SignUpParam(...).copyWith(id: 12, name: "My name")
  /// ````
  SignUpParam call({
    Object? firstName = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
  }) {
    return SignUpParam(
      firstName: firstName == const $CopyWithPlaceholder() || firstName == null
          ? _value.firstName
          // ignore: cast_nullable_to_non_nullable
          : firstName as String,
      country: country == const $CopyWithPlaceholder() || country == null
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as Country,
      lastName: lastName == const $CopyWithPlaceholder() || lastName == null
          ? _value.lastName
          // ignore: cast_nullable_to_non_nullable
          : lastName as String,
      phone: phone == const $CopyWithPlaceholder() || phone == null
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
    );
  }
}

extension $SignUpParamCopyWith on SignUpParam {
  /// Returns a callable class that can be used as follows: `instanceOfSignUpParam.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SignUpParamCWProxy get copyWith => _$SignUpParamCWProxyImpl(this);
}
