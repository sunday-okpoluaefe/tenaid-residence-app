import 'dart:ui';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/app.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/account/domain/entity/account_domain.dart';
import 'package:tenaid_mobile/library/account/domain/use_cases/get_account_usecase.dart';
import 'package:tenaid_mobile/library/account/domain/use_cases/get_authorization_usecase.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/paginate_param.dart';
import 'package:tenaid_mobile/library/community/domain/use_cases/get_primary_account_community_usecase.dart';
import 'package:tenaid_mobile/library/core/domain/entity/paginated_result.dart';
import 'package:tenaid_mobile/library/message/domain/entity/community_message_domain.dart';
import 'package:tenaid_mobile/library/message/domain/entity/message_param.dart';
import 'package:tenaid_mobile/library/message/domain/usecase/get_last_message_read_date_usecase.dart';
import 'package:tenaid_mobile/library/message/domain/usecase/get_unread_messages_usecase.dart';
import 'package:tenaid_mobile/utils/network.dart';
import 'package:tenaid_mobile/utils/worker.dart';
import 'package:tenaid_mobile/utils/xts/message_xts.dart';

import '../../../../../library/message/domain/usecase/get_messages_usecase.dart';
import '../../../../../utils/app_bloc.dart';
import '../../../../../utils/message_service.dart';
import '../../../../../utils/notification_service/notification_service.dart';
import '../../../../../utils/triple.dart';
import '../../../home_screen.dart';

part 'message_screen_bloc.g.dart';
part 'message_screen_event.dart';
part 'message_screen_state.dart';

@injectable
class MessageScreenBloc
    extends AppBloc<MessageScreenEvent, MessageScreenState> {
  final MessageService messageService;
  final GetAuthorizationUseCase getAuthorization;
  final GetPrimaryAccountCommunityUseCase getPrimaryAccountCommunity;
  final GetMessagesUseCase getMessages;
  final GetAccountUseCase getAccount;
  final GetLastMessageReadDateUseCase getLastMessageReadDate;
  final GetUnreadMessagesUseCase getUnreadMessages;

  AccountCommunityDomain? community;

  Future<Triple<List<CommunityMessageDomain>, bool, int>> unreadMessages(
      {required int page, String? date}) async {
    PaginatedResult paginatedResult = await getUnreadMessages(
        UnreadMessageParam(
            paginateParam: PaginateParam(query: date, page: page),
            community: community?.community?.id ?? ''));

    List<CommunityMessageDomain> messages = paginatedResult.data.isNotEmpty
        ? paginatedResult.data as List<CommunityMessageDomain>
        : <CommunityMessageDomain>[];

    return Triple(
        first: messages,
        second: paginatedResult.isLastPage,
        third: paginatedResult.totalPages);
  }

  _showNotification(
      {required String community,
      required String title,
      required String body}) {
    if (appLifecycleState != AppLifecycleState.resumed ||
        currentNavigationTab != 1 ||
        AppNavigatorObserver.currentRoute?.settings.name == null ||
        AppNavigatorObserver.currentRoute?.settings.name?.isEmpty == true) {
      NotificationService.showMessageNotification(
          title: title, body: body, community: community);
    }
  }

  MessageScreenBloc(
      this.messageService,
      this.getAuthorization,
      this.getPrimaryAccountCommunity,
      this.getMessages,
      this.getAccount,
      this.getLastMessageReadDate,
      this.getUnreadMessages)
      : super(MessageScreenState()) {
    on<OnInit>((event, emit) async {
      try {
        String token = await getAuthorization(true);
        community = await getPrimaryAccountCommunity(true);

        if (token.isNotEmpty && community != null) {
          await messageService.connect(
              token: token,
              community: community?.community?.id ?? '',
              member: community?.id ?? '',
              onConnected: () {
                handleUiEvent(OnGetUnreadMessages());
              },
              onDisConnected: () {});

          messageService.subscribe(
              event: MessageService.EVENT_NAME,
              onEvent: (CommunityMessageDomain message) async {
                // handle message events
                handleUiEvent(OnMessageReceived(message));

                // show push notifications
                if (message.author?.id == community?.id) return;
                if (message.type == 'text') {
                  _showNotification(
                      community: community?.community?.name ?? '',
                      title: message.author?.isAdmin == true
                          ? (community?.community?.name ?? '')
                          : message.author?.name ?? '',
                      body: message.body ?? '');
                } else {
                  _showNotification(
                      community: community?.community?.name ?? '',
                      title: message.author?.isAdmin == true
                          ? (community?.community?.name ?? '')
                          : message.author?.name ?? '',
                      body: 'A file has been shared with you');
                }
              });

          // listen for network changes
          networkNotifier.addListener(() {});
        }

        AccountDomain? account = await getAccount(false);

        List<CommunityMessageDomain> messages = await getMessages(true);
        emit(state.copyWith(
            messages: messages.sorted(),
            loading: false,
            user: AuthorDomain(
                id: community?.id ?? '',
                firstName: account.firstName,
                lastName: account.lastName,
                isAdmin: community?.isAdmin ?? false,
                photo: account.photo)));
      } catch (_) {}
    });

    on<OnSendMessage>((event, emit) async {
      MessageParam message = MessageParam(
          messageId: uniqueId(),
          body: event.body,
          description: event.description,
          type: event.type.name,
          date: DateTime.now().toUtc().toIso8601String(),
          repliedTo: event.repliedTo,
          community: community?.community?.id ?? '',
          author: community?.id ?? '');

      messageService.sendMessage(message);
    });

    on<OnGetUnreadMessages>((event, emit) async {
      try {
        String lastMessageDate = await getLastMessageReadDate(true);

        Triple<List<CommunityMessageDomain>, bool, int> result =
            await unreadMessages(page: 1, date: lastMessageDate);

        if (result.first.isEmpty) return;

        handleUiEvent(OnMessagesReceived(result.first));

        int totalPages = result.third;

        if (!result.second) {
          for (int page = 2; page <= totalPages; page++) {
            result = await unreadMessages(page: page, date: lastMessageDate);

            handleUiEvent(OnMessagesReceived(result.first));

            if (result.second) break;
          }
        }
      } on ApiException catch (_) {}
    });

    on<OnMessageReceived>((event, emit) {
      List<CommunityMessageDomain> messages = [];
      messages.addAll(state.messages);
      if (messages.isEmpty) {
        messages.add(event.message);
      } else {
        messages.insert(0, event.message);
      }
      emit(state.copyWith(messages: messages));
    });

    on<OnMessagesReceived>((event, emit) {
      List<CommunityMessageDomain> messages = [];
      messages.addAll(state.messages);
      messages.addAll(event.messages);

      _showNotification(
          community: community?.community?.name ?? '',
          title: 'New message',
          body: 'You may have unread messages');

      emit(state.copyWith(messages: messages.sorted()));
    });
  }
}
