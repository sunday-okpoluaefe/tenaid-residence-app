import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/feature/account/account_navigator.dart';
import 'package:tenaid_mobile/feature/home/bloc/home_screen_bloc.dart';
import 'package:tenaid_mobile/feature/home/home_navigator.dart';
import 'package:tenaid_mobile/feature/home/pages/dashboard/dashboard_screen.dart';
import 'package:tenaid_mobile/feature/home/pages/messages/message_screen.dart';
import 'package:tenaid_mobile/feature/home/pages/payments/payment_screen.dart';
import 'package:tenaid_mobile/feature/home/pages/visitors/visitors_screen.dart';
import 'package:tenaid_mobile/feature/notification/notification_navigator.dart';

import '../../app.dart';
import '../../ds/component/horizontal_line.dart';
import '../../utils/notification_service/notification_config.dart';
import '../../utils/notification_service/notification_service.dart';
import '../notification/notification_permission_screen.dart';
import 'components/bottom_bar.dart';
import 'components/top_appbar.dart';

int currentNavigationTab = 0;

class HomeScreen extends AppStatefulWidget {
  final int navigateTo;

  const HomeScreen({super.key, this.navigateTo = 0});

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

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null && message.data.isNotEmpty) {
        NotificationService.navigatedToScreen(message.data);
      }
    });

    // NotificationService.getBackgroundNotification()
    //     .then((NotificationResponse? notificationResponse) {
    //   // navigate to a specific screen
    //   if (notificationResponse != null)
    //     NotificationService.handleNavigation(notificationResponse.payload);
    // });

    // add app state listeners
    appLifecycleState = SchedulerBinding.instance.lifecycleState;
    appLifecycleListener = AppLifecycleListener(
      onStateChange: (state) {
        appLifecycleState = state;
      },
    );

    context
        .read<HomeScreenBloc>()
        .handleUiEvent(OnPageSelected(widget.navigateTo));

    homeNavigationListener.addListener(() {
      context
          .read<HomeScreenBloc>()
          .handleUiEvent(OnPageSelected(homeNavigationListener.value));
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
        body: SafeArea(
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
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HorizontalLine(),
            BottomBar(
              onTap: (int index) {
                context
                    .read<HomeScreenBloc>()
                    .handleUiEvent(OnPageSelected(index));
              },
              selected: state.selectedPage,
            )
          ],
        ),
      ),
      listener: (BuildContext context, HomeScreenState state) {
        if (state.requestPermission?.get() == true) {}
        currentNavigationTab = state.selectedPage;
      },
    );
  }
}
