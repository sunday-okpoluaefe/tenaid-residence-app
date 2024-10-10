import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/entity/paginate_param.dart';
import 'package:tenaid_mobile/library/core/domain/entity/paginated_result.dart';
import 'package:tenaid_mobile/library/message/domain/message_respository.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

class UnreadMessageParam {
  final PaginateParam paginateParam;
  final String community;

  UnreadMessageParam({required this.paginateParam, required this.community});
}

@injectable
class GetUnreadMessagesUseCase
    extends UseCase<UnreadMessageParam, PaginatedResult> {
  final MessageRepository repository;

  GetUnreadMessagesUseCase(this.repository);

  @override
  Future<PaginatedResult> call(UnreadMessageParam args) async =>
      await repository.getUnreadMessages(args.community,
          page: args.paginateParam.page,
          limit: args.paginateParam.limit,
          date: args.paginateParam.query as String);
}
