// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_result.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaginatedResultCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// PaginatedResult(...).copyWith(id: 12, name: "My name")
  /// ````
  PaginatedResult call({
    List<Object>? data,
    int? nextPage,
    int? currentPage,
    int? totalPages,
    int? totalItems,
    int? itemsPerPage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaginatedResult.copyWith(...)`.
class _$PaginatedResultCWProxyImpl implements _$PaginatedResultCWProxy {
  const _$PaginatedResultCWProxyImpl(this._value);

  final PaginatedResult _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// PaginatedResult(...).copyWith(id: 12, name: "My name")
  /// ````
  PaginatedResult call({
    Object? data = const $CopyWithPlaceholder(),
    Object? nextPage = const $CopyWithPlaceholder(),
    Object? currentPage = const $CopyWithPlaceholder(),
    Object? totalPages = const $CopyWithPlaceholder(),
    Object? totalItems = const $CopyWithPlaceholder(),
    Object? itemsPerPage = const $CopyWithPlaceholder(),
  }) {
    return PaginatedResult(
      data: data == const $CopyWithPlaceholder() || data == null
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<Object>,
      nextPage: nextPage == const $CopyWithPlaceholder() || nextPage == null
          ? _value.nextPage
          // ignore: cast_nullable_to_non_nullable
          : nextPage as int,
      currentPage:
          currentPage == const $CopyWithPlaceholder() || currentPage == null
              ? _value.currentPage
              // ignore: cast_nullable_to_non_nullable
              : currentPage as int,
      totalPages:
          totalPages == const $CopyWithPlaceholder() || totalPages == null
              ? _value.totalPages
              // ignore: cast_nullable_to_non_nullable
              : totalPages as int,
      totalItems:
          totalItems == const $CopyWithPlaceholder() || totalItems == null
              ? _value.totalItems
              // ignore: cast_nullable_to_non_nullable
              : totalItems as int,
      itemsPerPage:
          itemsPerPage == const $CopyWithPlaceholder() || itemsPerPage == null
              ? _value.itemsPerPage
              // ignore: cast_nullable_to_non_nullable
              : itemsPerPage as int,
    );
  }
}

extension $PaginatedResultCopyWith on PaginatedResult {
  /// Returns a callable class that can be used as follows: `instanceOfPaginatedResult.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$PaginatedResultCWProxy get copyWith => _$PaginatedResultCWProxyImpl(this);
}
