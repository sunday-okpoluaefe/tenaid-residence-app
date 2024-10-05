import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/assets/assets.gen.dart';
import 'package:tenaid_mobile/ds/component/linear_progress_indicator.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../ds/component/primary_button.dart';
import '../../../ds/component/spacing.dart';
import '../account_navigator.dart';
import 'component/onboarding_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<OnboardingScreen> {
  final AccountNavigator _accountNavigator =
      GetIt.instance.get<AccountNavigator>();

  late Timer timer;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        timer = Timer.periodic(
          const Duration(seconds: 4),
          (timer) {
            setState(
              () {
                if (currentPage < 3) {
                  currentPage++;
                } else {
                  currentPage = 0;
                }
              },
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      OnBoardingItem(
          key: Key('page1'),
          icon: Assets.inviteFriends.svg(height: 300.h),
          title: context.locale.invite_friends_intro,
          body: context.locale.invite_friends_intro_body),
      OnBoardingItem(
          key: Key('page2'),
          icon: Assets.payments.svg(height: 300.h),
          title: context.locale.payment_intro,
          body: context.locale.payment_intro_body),
      OnBoardingItem(
          key: Key('page3'),
          icon: Assets.offlineService.svg(height: 300.h),
          title: context.locale.offline_intro,
          body: context.locale.offline_intro_body),
      OnBoardingItem(
          key: Key('page4'),
          icon: Assets.announce.svg(height: 300.h),
          title: context.locale.message_intro,
          body: context.locale.message_intro_body)
    ];

    return Stack(
      children: [
        Container(color: Theme.of(context).colorScheme.surface),
        Positioned(child: SvgPicture.asset('assets/pattern.svg')),
        SafeArea(
            child: Padding(
          padding: EdgeInsets.only(
              top: Spacing.extraExtraLarge_h,
              left: Spacing.small_w,
              right: Spacing.small_w),
          child: Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: pages[currentPage],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Spacing.small_h),
                child: TLinearProgressIndicator(
                    steps: 4, current: currentPage + 1),
              )
            ],
          ),
        )),
        Positioned(
            bottom: Spacing.none,
            right: Spacing.none,
            left: Spacing.none,
            child: SafeArea(
                child: PrimaryButton(
                    title: context.locale.get_started,
                    modifier: EdgeInsets.only(
                        bottom: Spacing.small_h,
                        left: Spacing.small_w,
                        right: Spacing.small_w),
                    loading: false,
                    enabled: true,
                    onClick: () {
                      _accountNavigator.toLogin();
                    }))),
      ],
    );
  }
}
