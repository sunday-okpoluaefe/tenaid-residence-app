import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tenaid_mobile/assets/assets.gen.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/feature/community/community_navigator.dart';
import 'package:tenaid_mobile/feature/community/pending_join_request/bloc/pending_join_request_bloc.dart';
import 'package:tenaid_mobile/library/community/domain/entity/join_request_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../ds/component/dotted_loader.dart';
import '../../../ds/component/empty_screen.dart';
import '../../../library/core/domain/entity/paginated_result.dart';
import '../../../utils/xts/global_notifier.dart';
import 'components/join_request_item.dart';

class PendingJoinRequestScreen extends AppStatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PendingJoinRequestScreen> {
  final PendingJoinRequestBloc bloc = GetIt.instance.get();
  final PagingController<int, JoinRequestDomain> _pagingController =
      PagingController(firstPageKey: 1);

  final CommunityNavigator navigator = GetIt.instance.get();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      bloc.handleUiEvent(OnLoadRequests(page: pageKey, limit: 10));
      bloc.handleUiEvent(OnGetPrimaryCommunity());
    });

    syncRequiredNotifier.addListener(() {
      if (syncRequiredNotifier.syncRequired && mounted) {
        _pagingController.refresh();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, PendingJoinRequestState state) => Scaffold(
            appBar: AppBar(),
            body: SafeArea(child: _screen(context, state)),
          ),
      listener: (_, PendingJoinRequestState state) {
        PaginatedResult? result = state.requests?.get();

        if (result != null) {
          List<JoinRequestDomain> visitors = result.data.isEmpty
              ? <JoinRequestDomain>[]
              : result.data as List<JoinRequestDomain>;

          if (result.isLastPage) {
            _pagingController.appendLastPage(visitors);
          } else {
            _pagingController.appendPage(visitors, result.nextPage);
          }
        }

        _pagingController.error = state.error?.get();
      });

  Widget _screen(BuildContext context, PendingJoinRequestState state) =>
      AppScrollView(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.small),
            child: PageHeader(
              title: 'Join Requests',
              descriptionWidget: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.location.svg(height: Spacing.small),
                  SizedBox(
                    width: Spacing.extraSmall,
                  ),
                  Text('${state.primaryCommunity?.community?.name}',
                      style: context.text.bodyMedium?.fade(context))
                ],
              ),
              bottom: Spacing.small,
            ),
          ),
          _content(context, state)
        ],
      ));

  Widget _content(BuildContext context, PendingJoinRequestState state) =>
      SizedBox(
          height: MediaQuery.of(context).size.height,
          child: PagedListView.separated(
            physics: NeverScrollableScrollPhysics(),
            pagingController: _pagingController,
            shrinkWrap: true,
            builderDelegate: PagedChildBuilderDelegate<JoinRequestDomain>(
                itemBuilder: (_, item, index) {
                  return JoinRequestItem(
                    request: item,
                    onTap: (request) => navigator.toJoinRequestDetails(
                        request: request, root: widget),
                  );
                },
                firstPageProgressIndicatorBuilder: (_) => topLoader(context),
                newPageProgressIndicatorBuilder: (_) => loader(context),
                newPageErrorIndicatorBuilder: (_) => SizedBox(),
                firstPageErrorIndicatorBuilder: (_) => EmptyScreen(
                      hasError: true,
                      onTryAgain: () => _pagingController.refresh(),
                    ),
                noItemsFoundIndicatorBuilder: (_) => EmptyScreen(
                      onTryAgain: () => _pagingController.refresh(),
                    )),
            separatorBuilder: (BuildContext context, int index) => Container(
              height: Spacing.extraSmall,
              color: context.color.surfaceContainer,
            ),
          ));
}
