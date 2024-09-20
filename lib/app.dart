import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/feature/account/account_navigator.dart';
import 'package:tenaid_mobile/feature/home/home_navigator.dart';
import 'package:tenaid_mobile/utils/country_utils/country_utils.dart';
import 'package:tenaid_mobile/utils/http_overrides.dart';
import 'package:tenaid_mobile/utils/network.dart';
import 'package:tenaid_mobile/utils/notification_service/notification_service.dart';
import 'package:tenaid_mobile/utils/worker.dart';
import 'package:workmanager/workmanager.dart';

import 'core/local/database.dart';
import 'di/di.dart';
import 'ds/theme/tapp_theme.dart';
import 'feature/home/bloc/home_screen_bloc.dart';
import 'feature/home/pages/dashboard/bloc/dashboard_screen_bloc.dart';
import 'feature/home/pages/messages/bloc/message_screen_bloc.dart';
import 'feature/home/pages/payments/bloc/payment_screen_bloc.dart';
import 'feature/home/pages/visitors/bloc/visitor_screen_bloc.dart';
import 'firebase_options.dart';
import 'library/account/domain/use_cases/islogin_usecase.dart';
import 'utils/notification_service/notification_config.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future run() async {
  configureDependencies();
  HttpOverrides.global = AppHttpOverrides();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final IsLoginUseCase isLoggedIn = GetIt.instance.get<IsLoginUseCase>();
  final bool loggedIn = await isLoggedIn(true);

  await setupFirebaseNotification();
  await NotificationService.initializeLocalNotification();

  // define listeners for auto data updates
  final DashboardScreenBloc dashboard = GetIt.instance.get();
  final MessageScreenBloc messages = GetIt.instance.get();
  final PaymentScreenBloc payments = GetIt.instance.get();
  final VisitorScreenBloc visitors = GetIt.instance.get();
  final HomeScreenBloc home = GetIt.instance.get();

  await setupDatabase();
  await initCountryUtils();

  // enable invite work handler
  Workmanager().initialize(callbackDispatcher);

  setupNetworkNotifier();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => dashboard),
    BlocProvider(create: (_) => messages),
    BlocProvider(create: (_) => payments),
    BlocProvider(create: (_) => visitors),
    BlocProvider(create: (_) => home),
  ], child: App(isLoggedIn: loggedIn)));
}

class App extends StatelessWidget {
  final bool isLoggedIn;

  const App({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tenaid',
      navigatorKey: navigatorKey,
      initialRoute:
          isLoggedIn ? HomeNavigator.home : AccountNavigator.onboarding,
      routes: {...AccountNavigator.accountRoutes, ...HomeNavigator.homeRoutes},
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.light,
      //darkTheme: TAppTheme.dark,
    );
  }
}
