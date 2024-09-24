import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/data/model/access_point.dart';
import 'package:tenaid_mobile/library/community/domain/entity/access_point_domain.dart';
import 'package:tenaid_mobile/utils/mapper.dart';

@injectable
class AccessPointToDomainMapper extends Mapper<AccessPoint, AccessPointDomain> {
  @override
  AccessPointDomain map(AccessPoint from) => AccessPointDomain(
      name: from.name ?? '', description: from.description ?? '');
}
