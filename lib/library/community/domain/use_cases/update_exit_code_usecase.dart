import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/library/community/domain/entity/exit_code_param.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class UpdateExitCodeUseCase extends UseCase<ExitCodeParam, void> {
  final CommunityRepository repository;

  UpdateExitCodeUseCase(this.repository);

  @override
  Future<void> call(ExitCodeParam args) async =>
      await repository.updateVisitorExitCode(args);
}
