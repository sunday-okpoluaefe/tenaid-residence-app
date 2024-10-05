import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/feature/home/pages/visitors/pages/bloc/visitors_list_screen_bloc.dart';
import 'package:tenaid_mobile/feature/home/pages/visitors/pages/visitors_list_screen.dart';

import '../../../../ds/component/animated_tab.dart';
import '../../../../ds/component/spacing.dart';

class VisitorsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<VisitorsScreen> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) => AppScrollView(
          body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.small_w),
            child: AnimatedAppTab(
                onChanged: (x) {
                  setState(() {
                    selectedPage = x;
                  });
                },
                items: ['All', 'Today', 'Upcoming']),
          ),
          IndexedStack(
            index: selectedPage,
            children: [
              VisitorsListScreen(type: ListType.all),
              VisitorsListScreen(type: ListType.today),
              VisitorsListScreen(type: ListType.upcoming)
            ],
          )
        ],
      ));
}
