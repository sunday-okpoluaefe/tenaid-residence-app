import 'package:copy_with_extension/copy_with_extension.dart';

part 'paginated_result.g.dart';

@CopyWith(skipFields: true)
class PaginatedResult {
  final List<Object> data;
  final int currentPage;
  final int totalItems;
  final int nextPage;
  final int totalPages;
  final int itemsPerPage;

  const PaginatedResult(
      {this.data = const [],
      this.nextPage = 0,
      this.currentPage = 0,
      this.totalPages = 0,
      this.totalItems = 0,
      this.itemsPerPage = 0});

  bool get isLastPage => currentPage >= totalPages;
}
