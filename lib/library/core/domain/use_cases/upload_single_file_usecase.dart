import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/core/domain/core_repository.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class UploadSingleFileUseCase extends UseCase<String, String> {
  final CoreRepository repository;

  UploadSingleFileUseCase(this.repository);

  @override
  Future<String> call(String args) async => repository.uploadSingle(args);
}
