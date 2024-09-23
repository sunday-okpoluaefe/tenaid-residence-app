import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class GetJoinRequestCountUseCase extends UseCase<void, int> {
  final CommunityRepository repository;

  GetJoinRequestCountUseCase(this.repository);

  @override
  Future<int> call(void args) async => repository.joinRequestsCount();
}
