import 'package:flutter/material.dart';
import 'package:tenaid_mobile/feature/home/home_screen.dart';
import 'package:tenaid_mobile/feature/home/pages/dashboard/dashboard_screen.dart';
import 'package:tenaid_mobile/feature/home/pages/messages/message_screen.dart';
import 'package:tenaid_mobile/feature/home/pages/payments/payment_screen.dart';
import 'package:tenaid_mobile/feature/home/pages/visitors/visitors_screen.dart';
import 'package:tenaid_mobile/utils/route_utils/base_navigator.dart';

class HomeNavigator extends BaseNavigator {
  static const String home = '/home';
  static const String dashboard = '/home/dashboard';
  static const String messages = '/home/messages';
  static const String payments = '/home/payments';
  static const String visitors = '/home/visitors';

  static Map<String, WidgetBuilder> homeRoutes = {
    home: (BuildContext context) => HomeScreen(),
    dashboard: (BuildContext context) => DashboardScreen(),
    messages: (BuildContext context) => MessageScreen(),
    payments: (BuildContext context) => PaymentScreen(),
    visitors: (BuildContext context) => VisitorsScreen()
  };
}
