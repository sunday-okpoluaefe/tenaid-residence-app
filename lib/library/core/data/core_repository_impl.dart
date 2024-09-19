import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api.dart';
import 'package:tenaid_mobile/library/core/data/mapper/place_to_domain_mapper.dart';
import 'package:tenaid_mobile/library/core/data/model/place.dart';
import 'package:tenaid_mobile/library/core/domain/core_repository.dart';
import 'package:tenaid_mobile/library/core/domain/entity/place_domain.dart';

@Injectable(as: CoreRepository)
class CoreRepositoryImpl implements CoreRepository {
  final Api api;
  final PlaceToDomainMapper mapper;

  CoreRepositoryImpl(this.api, this.mapper);

  @override
  Future<List<PlaceDomain>> searchAddress(String query) async {
    final Map<String, dynamic> data = Map();
    data['address'] = query;

    final response = await api(
        url: 'location/search', requestType: RequestType.get, params: data);

    return List<PlaceDomain>.from(response.data
        .map((json) => Place.fromJson(json))
        .map((p) => mapper.map(p)));
  }
}
