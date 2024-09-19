import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/core/domain/core_repository.dart';
import 'package:tenaid_mobile/library/core/domain/entity/place_domain.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class SearchAddressUseCase extends UseCase<String, List<PlaceDomain>> {
  final CoreRepository repository;

  SearchAddressUseCase(this.repository);

  @override
  Future<List<PlaceDomain>> call(String args) async =>
      repository.searchAddress(args);
}
