import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';

import 'bloc/notification_screen_bloc.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<NotificationScreen> {
  final NotificationScreenBloc bloc = GetIt.instance.get();

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, NotificationScreenState state) => Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: _screen(context, state),
          )),
      listener: (_, NotificationScreenState state) {});

  Widget _screen(BuildContext context, NotificationScreenState state) => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.small),
            child: PageHeader(title: 'Notifications'),
          )
        ],
      );
}
