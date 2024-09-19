import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/data/mapper/street_to_domain_mapper.dart';
import 'package:tenaid_mobile/library/community/data/model/visitor.dart';
import 'package:tenaid_mobile/library/community/domain/entity/visitor_domain.dart';
import 'package:tenaid_mobile/utils/mapper.dart';

@injectable
class VisitorToDomainMapper extends Mapper<Visitor, VisitorDomain> {
  final StreetToDomainMapper streetMapper;

  VisitorToDomainMapper(this.streetMapper);

  @override
  VisitorDomain map(Visitor from) => VisitorDomain(
      id: from.id,
      street: streetMapper.map(from.street),
      name: from.name,
      date: from.date,
      photo: from.photo,
      code: from.code,
      start: from.start,
      end: from.end,
      reason: from.reason,
      status: from.status);
}
