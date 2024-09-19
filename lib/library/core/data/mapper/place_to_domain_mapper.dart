import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/core/data/model/place.dart';
import 'package:tenaid_mobile/library/core/domain/entity/place_domain.dart';
import 'package:tenaid_mobile/utils/mapper.dart';

@injectable
class PlaceToDomainMapper extends Mapper<Place, PlaceDomain> {
  @override
  PlaceDomain map(Place from) => PlaceDomain(
      name: from.name,
      address: from.address,
      latitude: from.latitude,
      longitude: from.longitude,
      types: from.types);
}
