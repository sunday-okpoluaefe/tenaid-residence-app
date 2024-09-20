import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/core/domain/core_repository.dart';
import 'package:tenaid_mobile/library/core/domain/entity/notification_domain.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class GetNotificationsUseCase extends UseCase<void, List<NotificationDomain>> {
  final CoreRepository repository;

  GetNotificationsUseCase(this.repository);

  @override
  Future<List<NotificationDomain>> call(void args) async =>
      repository.getNotifications();
}
