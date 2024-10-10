import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/core/domain/entity/paginated_result.dart';
import 'package:tenaid_mobile/library/message/data/model/community_message.dart';

import '../../../../core/network/api.dart';
import '../../../../core/network/network_response.dart';

@injectable
class RemoteMessageDataSource {
  final Api api;

  RemoteMessageDataSource(this.api);

  Future<PaginatedResult> getMessages(String community,
      {required int page, required int limit, String? date}) async {
    Map<String, dynamic> map = Map();
    map['page'] = page;
    map['limit'] = limit;
    if (date?.isNotEmpty == true) map['date'] = date;

    NetworkResponse response = await api(
        url: 'community/$community/messages',
        requestType: RequestType.get,
        params: map);

    PaginatedResult result = PaginatedResult.parse(response.data);
    return result.copyWith(
        data: List<CommunityMessage>.from(response.data['docs']
            .map((data) => CommunityMessage.fromJson(data))));
  }
}
