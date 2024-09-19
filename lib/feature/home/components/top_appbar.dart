import 'package:flutter/material.dart';
import 'package:tenaid_mobile/feature/home/components/profile_image.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/spacing.dart';

class TopSliverAppBar extends StatelessWidget {
  final String title;

  const TopSliverAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) => SliverAppBar(
        backgroundColor: context.color.surface,
        pinned: false,
        floating: false,
        toolbarHeight: Spacing.extraExtraLarge,
        flexibleSpace: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.text.headlineSmall,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Badge(
                    label: Text('2'),
                    child: Assets.navNotify.svg(),
                  ),
                  SizedBox(
                    width: Spacing.medium,
                  ),
                  ProfileImage(path: '')
                ],
              )
            ],
          ),
        ),
      );
}

String _title(BuildContext context, int index) {
  switch (index) {
    case 0:
      return context.locale.nav_home;
    case 1:
      return context.locale.nav_message;
    case 2:
      return context.locale.nav_payment;
    default:
      return context.locale.nav_visitor;
  }
}

AppBar TopAppBar(BuildContext context,
        {required int page,
        required String? profilePhoto,
        required Function() onProfileClicked,
        required Function() onNotificationsClicked}) =>
    AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _title(context, page),
            style: context.text.headlineSmall,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: onNotificationsClicked,
                child: Badge(
                  label: Text('2'),
                  child: Assets.navNotify.svg(),
                ),
              ),
              SizedBox(
                width: Spacing.medium,
              ),
              GestureDetector(
                onTap: onProfileClicked,
                child: ProfileImage(path: profilePhoto ?? ""),
              )
            ],
          )
        ],
      ),
    );
