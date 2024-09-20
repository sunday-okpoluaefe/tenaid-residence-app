import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/library/community/domain/entity/create_community_param.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class CreateCommunityUseCase extends UseCase<CreateCommunityParam, void> {
  final CommunityRepository repository;

  CreateCommunityUseCase(this.repository);

  @override
  Future<void> call(CreateCommunityParam args) async =>
      await repository.createCommunity(param: args);
}
