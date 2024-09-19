import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tenaid_mobile/assets/assets.gen.dart';
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
  final _controller = PageController();
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
                if (currentPage < 2) {
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
    _controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      OnBoardingItem(
          key: Key('page1'),
          icon: Assets.gifting.svg(height: 200),
          title: context.locale.invite_friends_intro,
          body: context.locale.invite_friends_intro_body),
      OnBoardingItem(
          key: Key('page2'),
          icon: Assets.pricing.svg(height: 200),
          title: context.locale.payment_intro,
          body: context.locale.payment_intro_body),
      OnBoardingItem(
          key: Key('page3'),
          icon: Assets.team.svg(height: 200),
          title: context.locale.offline_intro,
          body: context.locale.offline_intro_body)
    ];

    return Stack(
      children: [
        Container(color: Theme.of(context).colorScheme.surface),
        Positioned(child: SvgPicture.asset('assets/pattern.svg')),
        SafeArea(
            child: Padding(
          padding: EdgeInsets.only(
              top: Spacing.extraExtraLarge,
              left: Spacing.small,
              right: Spacing.small),
          child: Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: pages[currentPage],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Spacing.small),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [_pageIndicator(context)],
                ),
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
                        bottom: Spacing.small,
                        left: Spacing.small,
                        right: Spacing.small),
                    loading: false,
                    enabled: true,
                    onClick: () {
                      _accountNavigator.toLogin();
                    }))),
      ],
    );
  }

  _pageIndicator(BuildContext context) => SmoothPageIndicator(
        controller: _controller,
        count: 3,
        effect: ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: context.color.onSurface),
      );
}
