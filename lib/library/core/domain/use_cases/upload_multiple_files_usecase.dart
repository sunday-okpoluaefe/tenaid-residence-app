import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/core/domain/core_repository.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class UploadMultipleFilesUseCase extends UseCase<List<String>, List<String>> {
  final CoreRepository repository;

  UploadMultipleFilesUseCase(this.repository);

  @override
  Future<List<String>> call(List<String> args) async =>
      await repository.uploadMultiple(args);
}
