import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/account/domain/account_repository.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class UploadFileUseCase extends UseCase<String, String> {
  final AccountRepository repository;

  UploadFileUseCase(this.repository);

  @override
  Future<String> call(String args) async => repository.upload(args);
}
