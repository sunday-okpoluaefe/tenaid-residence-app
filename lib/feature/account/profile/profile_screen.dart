import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/horizontal_line.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/ds/component/tlinear_process_indicator.dart';
import 'package:tenaid_mobile/feature/account/account_navigator.dart';
import 'package:tenaid_mobile/feature/account/profile/bloc/profile_screen_bloc.dart';
import 'package:tenaid_mobile/feature/community/community_navigator.dart';
import 'package:tenaid_mobile/utils/xts/global_notifier.dart';
import 'package:tenaid_mobile/utils/xts/list_xt.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/page_loader.dart';
import '../../../ds/component/settings_item.dart';
import 'components/data_item.dart';
import 'components/picture_item.dart';

class ProfileScreen extends AppStatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends AppState<ProfileScreen> {
  final ProfileScreenBloc bloc = GetIt.instance.get();
  final AccountNavigator navigator = GetIt.instance.get();
  final CommunityNavigator communityNavigator = GetIt.instance.get();

  @override
  void initState() {
    super.initState();
    bloc.handleUiEvent(OnFetchProfile());

    syncRequiredNotifier.addListener(() {
      if (syncRequiredNotifier.syncRequired)
        bloc.handleUiEvent(OnFetchProfile());
    });
  }

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, ProfileScreenState state) => Scaffold(
            appBar: AppBar(
              actions: [
                InkWell(
                  onTap: () => navigator.toEditProfile().then((_) {
                    bloc.handleUiEvent(OnFetchProfile());
                  }),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Spacing.small_w),
                    child: Assets.edit.svg(),
                  ),
                )
              ],
            ),
            body: body(context, state),
          ),
      listener: (_, ProfileScreenState state) {
        widget.handleApiError(context, state.error?.get());

        if (state.showLogin?.get() == true) navigator.toLogin();
      });

  Widget body(BuildContext context, ProfileScreenState state) => SafeArea(
      child: AppScrollView(
          top: state.isLoggingOut ? TLinearProcessIndicator() : SizedBox(),
          body: state.loading
              ? PageLoader()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Spacing.small_w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Spacing.small_h,
                          ),
                          PictureItem(
                            onQrClicked: () {},
                            onJoinCommunity: () =>
                                communityNavigator.toJoinCommunity(),
                            name:
                                '${state.account?.firstName} ${state.account?.lastName}',
                            imageUrl: '${state.account?.photo}',
                            community:
                                state.communities?.primary?.community?.name,
                          ),
                          SizedBox(
                            height: Spacing.medium_h,
                          ),
                          DataItem(
                            phone: '${state.account?.phone}',
                            email: '${state.account?.email?.value}',
                          ),
                          SizedBox(
                            height: Spacing.medium_h,
                          ),
                          // if (state.communities?.primary != null)
                          //   Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         context.locale.section_community,
                          //         style: context.text.titleMedium,
                          //       ),
                          //       CommunityRequest(
                          //           accountCommunity:
                          //               state.communities!.primary!)
                          //     ],
                          //   ),
                          SizedBox(
                            height: Spacing.small_h,
                          ),
                          Text(
                            context.locale.settings,
                            style: context.text.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      margin: EdgeInsets.only(top: Spacing.extraSmall_h),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Spacing.small_w),
                            child: Column(
                              children: [
                                SettingsItem(
                                  label: 'Dark mode',
                                  isSwitch: true,
                                  icon: Assets.moon.svg(),
                                ),
                                SettingsItem(
                                  label: 'Communities',
                                  onTap: () =>
                                      communityNavigator.toCommunities(),
                                  icon: Assets.communities.svg(),
                                ),
                                SettingsItem(
                                  label: 'Change password',
                                  onTap: () => navigator.toChangePassword(),
                                  icon: Assets.passwordChange.svg(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: Spacing.small_h),
                            child: HorizontalLine(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Spacing.small_w),
                            child: Column(
                              children: [
                                SettingsItem(
                                  label: 'Logout',
                                  isError: true,
                                  onTap: () {
                                    bloc.handleUiEvent(OnLogout());
                                    navigator.toLogin();
                                  },
                                  icon: Assets.logout.svg(),
                                ),
                                SettingsItem(
                                  label: 'Delete account',
                                  isError: true,
                                  icon: Assets.trash.svg(),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )));
}
