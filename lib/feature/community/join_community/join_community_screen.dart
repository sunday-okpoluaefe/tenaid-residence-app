import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/icon_size.dart';
import 'package:tenaid_mobile/ds/component/linear_progress_indicator.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/primary_button.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/ds/component/text_field.dart';
import 'package:tenaid_mobile/feature/community/community_navigator.dart';
import 'package:tenaid_mobile/feature/community/join_community/bloc/join_community_screen_bloc.dart';
import 'package:tenaid_mobile/feature/community/join_community/components/community_overview.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../assets/assets.gen.dart';

class JoinCommunityScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<JoinCommunityScreen> {
  final JoinCommunityScreenBloc _bloc =
      GetIt.instance.get<JoinCommunityScreenBloc>();

  final CommunityNavigator _communityNavigator =
      GetIt.instance.get<CommunityNavigator>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: BlocConsumer(
            bloc: _bloc,
            builder: (_, JoinCommunityScreenState state) =>
                SafeArea(child: _body(context, state)),
            listener: (_, JoinCommunityScreenState state) {
              JoinCommunityNavState? nav = state.nav?.get();
              if (nav != null && nav is ShowSearchScreen) {
                _communityNavigator.toSearchCommunity((community) {
                  _bloc.handleUiEvent(OnCommunitySelected(community));
                });
              } else if (nav != null && nav is ShowStreetScreen) {
                _communityNavigator.toWhereYouLive(state.selected!);
              }
            }),
      );

  Widget _body(BuildContext context, JoinCommunityScreenState state) =>
      AppScrollView(
          top: const TLinearProgressIndicator(steps: 4, current: 1),
          body: Padding(
            padding: EdgeInsets.only(
                left: Spacing.small_w,
                right: Spacing.small_w,
                top: Spacing.extraSmall_h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageHeader(
                  title: context.locale.join_community,
                  description: context.locale.search_community_body,
                  top: Spacing.extraSmall_h,
                ),
                SizedBox(height: Spacing.medium_h),
                TTextField(
                  label: context.locale.search_community,
                  readOnly: true,
                  onTap: () => _bloc.handleUiEvent(OnSearch()),
                  prefixIcon: Assets.search
                      .svg(width: IconSize.medium.width, fit: BoxFit.scaleDown),
                ),
                if (state.selected != null)
                  Column(
                    children: [
                      SizedBox(
                        height: Spacing.medium_h,
                      ),
                      CommunityOverview(community: state.selected!)
                    ],
                  )
              ],
            ),
          ),
          bottom: PrimaryButton(
            title: context.locale.continue_button,
            enabled: state.validated,
            onClick: () {
              _bloc.handleUiEvent(OnContinue());
            },
            modifier: EdgeInsets.symmetric(
                horizontal: Spacing.small_w, vertical: Spacing.small_h),
          ));
}
