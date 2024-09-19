import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/feature/account/account_navigator.dart';
import 'package:tenaid_mobile/feature/home/bloc/home_screen_bloc.dart';
import 'package:tenaid_mobile/feature/home/pages/dashboard/dashboard_screen.dart';
import 'package:tenaid_mobile/feature/home/pages/messages/message_screen.dart';
import 'package:tenaid_mobile/feature/home/pages/payments/payment_screen.dart';
import 'package:tenaid_mobile/feature/home/pages/visitors/visitors_screen.dart';
import 'package:tenaid_mobile/feature/notification/notification_navigator.dart';
import 'package:tenaid_mobile/utils/notification_service/notification_service.dart';

import '../../utils/notification_service/notification_config.dart';
import '../notification/notification_permission_screen.dart';
import 'components/bottom_bar.dart';
import 'components/top_appbar.dart';

class HomeScreen extends AppStatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends AppState<HomeScreen> {
  final dashboard = DashboardScreen();
  final messages = MessageScreen();
  final payments = PaymentScreen();
  final visitors = VisitorsScreen();

  final AccountNavigator accountNavigator = GetIt.instance.get();
  final NotificationNavigator notificationNavigator = GetIt.instance.get();

  //final _flutterAutostartPlugin = FlutterAutostart();

  // Future<void> checkIsAutoStartEnabled() async {
  //   if (!mounted) return;
  //   String isAutoStartEnabled;
  //   try {
  //     isAutoStartEnabled =
  //         await _flutterAutostartPlugin.checkIsAutoStartEnabled() == true
  //             ? "Yes"
  //             : "No";
  //     Log.d("isAutoStartEnabled: $isAutoStartEnabled");
  //
  //     await _flutterAutostartPlugin.showAutoStartPermissionSettings();
  //   } on PlatformException catch (error) {
  //     Log.e(error);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    sendDevicePushToken();
    context.read<HomeScreenBloc>().handleUiEvent(OnCheckPermission());
    context.read<HomeScreenBloc>().handleUiEvent(OnGetProfilePhoto());

    NotificationService.getBackgroundNotification()
        .then((NotificationResponse? notification) {
      if (notification != null) {
        // navigate to specific screen here
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenBloc, HomeScreenState>(
      builder: (_, HomeScreenState state) => Scaffold(
        appBar: TopAppBar(context,
            profilePhoto: state.profilePhoto,
            page: state.selectedPage,
            onProfileClicked: () => accountNavigator.toProfile(),
            onNotificationsClicked: () =>
                notificationNavigator.toNotifications()),
        body: Padding(
          padding: EdgeInsets.only(top: Spacing.extraSmall),
          child: SafeArea(
              child: IndexedStack(
            children: [
              state.notificationGranted
                  ? dashboard
                  : NotificationPermissionScreen(() {
                      context
                          .read<HomeScreenBloc>()
                          .handleUiEvent(OnCheckPermission());
                    }),
              messages,
              payments,
              visitors
            ],
            index: state.selectedPage,
          )),
        ),
        bottomNavigationBar: BottomBar(
          onTap: (int index) {
            context.read<HomeScreenBloc>().handleUiEvent(OnPageSelected(index));
          },
          selected: state.selectedPage,
        ),
      ),
      listener: (BuildContext context, HomeScreenState state) {
        if (state.requestPermission?.get() == true) {}
      },
    );
  }
}
