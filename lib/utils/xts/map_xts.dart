import 'package:tenaid_mobile/library/core/domain/entity/paginated_result.dart';

extension XTS on Map<String, dynamic> {
  PaginatedResult get paged => PaginatedResult(
      totalItems: this['totalItems'],
      currentPage: this['currentPage'],
      totalPages: this['totalPages'],
      nextPage: this['currentPage'] + 1,
      itemsPerPage: this['itemsPerPage']);
}
