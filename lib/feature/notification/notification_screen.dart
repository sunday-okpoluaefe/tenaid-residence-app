import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/feature/notification/components/notification_item.dart';
import 'package:tenaid_mobile/library/core/domain/entity/notification_domain.dart';
import 'package:tenaid_mobile/utils/xts/global_notifier.dart';

import '../../assets/assets.gen.dart';
import '../../ds/component/empty_screen.dart';
import 'bloc/notification_screen_bloc.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<NotificationScreen> {
  final NotificationScreenBloc bloc = GetIt.instance.get();

  @override
  void initState() {
    super.initState();

    bloc.handleUiEvent(OnLoadNotifications());

    syncRequiredNotifier.addListener(() {
      if (syncRequiredNotifier.syncRequired && mounted) {
        bloc.handleUiEvent(OnLoadNotifications());
      }
    });
  }

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, NotificationScreenState state) => Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: _screen(context, state),
          )),
      listener: (_, NotificationScreenState state) {});

  Widget _screen(BuildContext context, NotificationScreenState state) =>
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Spacing.small),
              child: PageHeader(title: 'Notifications'),
            ),
            SizedBox(
              height: Spacing.medium,
            ),
            if (state.notifications.isEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  EmptyScreen(
                    hasError: state.error,
                    emptyWidget: Assets.notificationsEmpty,
                    onTryAgain: () {
                      bloc.handleUiEvent(OnLoadNotifications());
                    },
                  )
                ],
              ),
            for (NotificationDomain notification in state.notifications)
              NotificationItem(notification: notification, onDelete: (x) {})
          ],
        ),
      );
}
