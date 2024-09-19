import 'package:tenaid_mobile/library/core/domain/entity/place_domain.dart';

abstract class CoreRepository {
  Future<List<PlaceDomain>> searchAddress(String query);
}
