import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';
import 'package:tenaid_mobile/utils/xts/message_xts.dart';

import '../../../../assets/assets.gen.dart';
import '../../../../ds/component/empty_screen.dart';
import '../../../../ds/component/spacing.dart';
import 'bloc/message_screen_bloc.dart';

class MessageScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MessageScreen> {
  final MessageScreenBloc bloc = GetIt.instance.get();

  @override
  void initState() {
    super.initState();

    if (mounted) bloc.handleUiEvent(OnInit());
  }

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, MessageScreenState state) => SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Chat(
                messages: state.messages.toUiMessages,
                showUserAvatars: true,
                showUserNames: true,
                onAttachmentPressed: () {},
                emptyState: EmptyScreen(
                  emptyWidget: Assets.emptyMessages,
                  title: 'No messages',
                  body: 'Your messages will appear here',
                ),
                theme: DefaultChatTheme(
                    primaryColor: context.color.primary,
                    secondaryColor: context.color.surfaceContainer,
                    messageInsetsVertical: Spacing.extraSmall_h,
                    messageBorderRadius: Spacing.small_w,
                    dateDividerMargin: EdgeInsets.only(bottom: Spacing.small_h),
                    dateDividerTextStyle: context.text.bodySmall!.fade(context),
                    sendButtonIcon: Assets.send.svg(fit: BoxFit.scaleDown),
                    attachmentButtonIcon: Assets.paperclip.svg(),
                    inputBackgroundColor: context.color.surfaceContainer,
                    inputPadding: EdgeInsets.fromLTRB(Spacing.small_w,
                        Spacing.small_h, Spacing.small_w, Spacing.small_h),
                    inputTextColor: context.color.secondary),
                onSendPressed: (types.PartialText message) {
                  bloc.handleUiEvent(OnSendMessage(
                      body: message.text,
                      repliedTo: message.repliedMessage?.remoteId));
                },
                user: state.user?.toUiUser() ?? types.User(id: '')),
          ),
      listener: (_, MessageScreenState state) {});
}

/*

 */
