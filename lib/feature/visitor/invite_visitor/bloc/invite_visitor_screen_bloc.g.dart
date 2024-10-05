// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_visitor_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InviteVisitorScreenStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// InviteVisitorScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  InviteVisitorScreenState call({
    bool? validated,
    bool? loading,
    String? dateTimeString,
    String? dateString,
    Resettable<ApiException>? error,
    Resettable<InviteDomain>? showDetailsScreen,
    bool? startTimeError,
    bool? endDateError,
    DateTime? startDate,
    TimeOfDay? startTime,
    DateTime? endDate,
    InviteType? type,
    int? validity,
    String? name,
    String? purpose,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInviteVisitorScreenState.copyWith(...)`.
class _$InviteVisitorScreenStateCWProxyImpl
    implements _$InviteVisitorScreenStateCWProxy {
  const _$InviteVisitorScreenStateCWProxyImpl(this._value);

  final InviteVisitorScreenState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// InviteVisitorScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  InviteVisitorScreenState call({
    Object? validated = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? dateTimeString = const $CopyWithPlaceholder(),
    Object? dateString = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? showDetailsScreen = const $CopyWithPlaceholder(),
    Object? startTimeError = const $CopyWithPlaceholder(),
    Object? endDateError = const $CopyWithPlaceholder(),
    Object? startDate = const $CopyWithPlaceholder(),
    Object? startTime = const $CopyWithPlaceholder(),
    Object? endDate = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? validity = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? purpose = const $CopyWithPlaceholder(),
  }) {
    return InviteVisitorScreenState(
      validated: validated == const $CopyWithPlaceholder() || validated == null
          ? _value.validated
          // ignore: cast_nullable_to_non_nullable
          : validated as bool,
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      dateTimeString: dateTimeString == const $CopyWithPlaceholder()
          ? _value.dateTimeString
          // ignore: cast_nullable_to_non_nullable
          : dateTimeString as String?,
      dateString: dateString == const $CopyWithPlaceholder()
          ? _value.dateString
          // ignore: cast_nullable_to_non_nullable
          : dateString as String?,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as Resettable<ApiException>?,
      showDetailsScreen: showDetailsScreen == const $CopyWithPlaceholder()
          ? _value.showDetailsScreen
          // ignore: cast_nullable_to_non_nullable
          : showDetailsScreen as Resettable<InviteDomain>?,
      startTimeError: startTimeError == const $CopyWithPlaceholder() ||
              startTimeError == null
          ? _value.startTimeError
          // ignore: cast_nullable_to_non_nullable
          : startTimeError as bool,
      endDateError:
          endDateError == const $CopyWithPlaceholder() || endDateError == null
              ? _value.endDateError
              // ignore: cast_nullable_to_non_nullable
              : endDateError as bool,
      startDate: startDate == const $CopyWithPlaceholder()
          ? _value.startDate
          // ignore: cast_nullable_to_non_nullable
          : startDate as DateTime?,
      startTime: startTime == const $CopyWithPlaceholder()
          ? _value.startTime
          // ignore: cast_nullable_to_non_nullable
          : startTime as TimeOfDay?,
      endDate: endDate == const $CopyWithPlaceholder()
          ? _value.endDate
          // ignore: cast_nullable_to_non_nullable
          : endDate as DateTime?,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as InviteType,
      validity: validity == const $CopyWithPlaceholder() || validity == null
          ? _value.validity
          // ignore: cast_nullable_to_non_nullable
          : validity as int,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      purpose: purpose == const $CopyWithPlaceholder()
          ? _value.purpose
          // ignore: cast_nullable_to_non_nullable
          : purpose as String?,
    );
  }
}

extension $InviteVisitorScreenStateCopyWith on InviteVisitorScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfInviteVisitorScreenState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$InviteVisitorScreenStateCWProxy get copyWith =>
      _$InviteVisitorScreenStateCWProxyImpl(this);
}
