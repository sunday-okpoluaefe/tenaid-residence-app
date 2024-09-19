import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/data/model/street.dart';
import 'package:tenaid_mobile/library/community/domain/entity/street_domain.dart';
import 'package:tenaid_mobile/utils/mapper.dart';

@injectable
class StreetToDomainMapper implements Mapper<Street?, StreetDomain?> {
  @override
  StreetDomain? map(Street? from) => from != null
      ? StreetDomain(
          id: from.id, name: from.name, description: from.description)
      : null;
}
