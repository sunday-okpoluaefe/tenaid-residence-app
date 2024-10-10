import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/data/mapper/community_to_domain_mapper.dart';
import 'package:tenaid_mobile/library/message/data/model/community_message.dart';
import 'package:tenaid_mobile/library/message/domain/entity/community_message_domain.dart';
import 'package:tenaid_mobile/utils/mapper.dart';

@injectable
class CommunityMessageMapper
    extends Mapper<CommunityMessage, CommunityMessageDomain> {
  @override
  CommunityMessageDomain map(CommunityMessage from) => CommunityMessageDomain(
      id: from.id,
      community: from.community != null
          ? CommunityToDomainMapper().map(from.community!)
          : null,
      description: from.description,
      author: AuthorDomain(
          id: from.author?.id,
          firstName: from.author?.extra?.firstName,
          lastName: from.author?.extra?.lastName,
          isAdmin: from.author?.isAdmin ?? false,
          photo: from.author?.extra?.photo),
      messageId: from.messageId,
      repliedTo: from.repliedTo != null
          ? CommunityMessageMapper().map(from.repliedTo!)
          : null,
      body: from.body,
      type: from.type,
      date: from.date);
}
