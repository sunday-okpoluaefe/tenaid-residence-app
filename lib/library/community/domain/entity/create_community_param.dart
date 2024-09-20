import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:tenaid_mobile/library/account/domain/entity/address_domain.dart';

part 'create_community_param.g.dart';

@CopyWith(skipFields: true)
class CreateCommunityParam {
  final String? name;
  final String? type;
  final String? description;
  final AddressDomain? address;
  final List<String> images;

  CreateCommunityParam(
      {this.name,
      this.description,
      this.type = 'Residential',
      this.address,
      this.images = const []});
}
