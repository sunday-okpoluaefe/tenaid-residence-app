import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/assets/assets.gen.dart';
import 'package:tenaid_mobile/ds/component/app_bottom_sheet.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/empty_screen.dart';
import 'package:tenaid_mobile/ds/component/horizontal_line.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/page_loader.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/feature/community/community_navigator.dart';
import 'package:tenaid_mobile/feature/community/list_community/components/add_community_bottomsheet.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';
import 'package:tenaid_mobile/utils/xts/global_notifier.dart';

import 'bloc/list_community_bloc.dart';
import 'components/list_community_item.dart';

class ListCommunityScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ListCommunityScreen> {
  final ListCommunityBloc bloc = GetIt.instance.get();
  final CommunityNavigator navigator = GetIt.instance.get();

  @override
  void initState() {
    super.initState();
    bloc.handleUiEvent(OnLoadCommunities());

    syncRequiredNotifier.addListener(() {
      if (syncRequiredNotifier.syncRequired) {
        bloc.handleUiEvent(OnLoadCommunities());
      }
    });
  }

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, ListCommunityState state) => Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      AppBottomSheet(
                              AddCommunityBottomSheet(
                                onJoin: () {
                                  navigator.back();
                                  navigator.toJoinCommunity(root: widget);
                                },
                                onCreate: () {
                                  navigator.back();
                                  navigator.toCreateCommunity(root: widget);
                                },
                              ),
                              title: 'Add community')
                          .show(context);
                    },
                    child: Assets.addCommunity.svg(),
                  )
                ],
              ),
            ),
            body: state.loading ? PageLoader() : _screen(context, state),
          ),
      listener: (_, ListCommunityState state) {});

  Widget _screen(BuildContext context, ListCommunityState state) =>
      AppScrollView(
          body: Padding(
        padding: EdgeInsets.only(right: Spacing.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Spacing.small),
              child: PageHeader(
                title: 'My Communities',
                bottom: Spacing.small,
              ),
            ),
            if (state.error || state.communities.isEmpty)
              EmptyScreen(
                hasError: state.error,
                onTryAgain: () => bloc.handleUiEvent(OnLoadCommunities()),
              )
            else
              for (AccountCommunityDomain community in state.communities)
                Column(
                  children: [
                    ListCommunityItem(
                      community: community,
                      onTap: (x) => navigator.toCommunityDetail(community: x),
                    ),
                    HorizontalLine()
                  ],
                )
          ],
        ),
      ));
}
