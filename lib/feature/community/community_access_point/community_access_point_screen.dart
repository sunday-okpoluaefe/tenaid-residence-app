import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/assets/assets.gen.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/empty_screen.dart';
import 'package:tenaid_mobile/ds/component/list_item.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/page_loader.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/feature/community/community_access_point/bloc/community_access_point_bloc.dart';
import 'package:tenaid_mobile/feature/community/community_navigator.dart';
import 'package:tenaid_mobile/library/community/domain/entity/access_point_domain.dart';
import 'package:tenaid_mobile/utils/xts/global_notifier.dart';

class CommunityAccessPointScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CommunityAccessPointScreen> {
  final CommunityAccessPointBloc bloc = GetIt.instance.get();
  final CommunityNavigator navigator = GetIt.instance.get();

  @override
  void initState() {
    super.initState();
    bloc.handleUiEvent(OnLoadAccessPoints());

    syncRequiredNotifier.addListener(() {
      if (syncRequiredNotifier.syncRequired)
        bloc.handleUiEvent(OnLoadAccessPoints());
    });
  }

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, CommunityAccessPointState state) => Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => navigator.toAddAccessPoint(),
                    child: Assets.penAdd.svg(),
                  )
                ],
              ),
            ),
            body: _screen(context, state),
          ),
      listener: (_, CommunityAccessPointState state) {});

  Widget _screen(BuildContext context, CommunityAccessPointState state) =>
      AppScrollView(
          body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              title: 'Access Points',
              bottom: Spacing.small,
            ),
            if (state.loading)
              PageLoader(
                padding: 0,
              )
            else if (state.accessPoints.isEmpty || state.error)
              EmptyScreen(
                hasError: state.error,
                onTryAgain: () {
                  if (state.error)
                    bloc.handleUiEvent(OnLoadAccessPoints());
                  else
                    navigator.toAddAccessPoint();
                },
                retryTitle: state.error ? 'Try again' : 'Add access point',
              )
            else if (state.accessPoints.isNotEmpty)
              for (AccessPointDomain access in state.accessPoints)
                ListItem(
                    itemModel: ListItemModel(
                        title: access.name,
                        description: access.description,
                        icon: Assets.securitySafe.svg()))
          ],
        ),
      ));
}
