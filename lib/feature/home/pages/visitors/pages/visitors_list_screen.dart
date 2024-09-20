import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tenaid_mobile/library/community/domain/entity/visitor_domain.dart';
import 'package:tenaid_mobile/library/core/domain/entity/paginated_result.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../../ds/component/app_bottom_sheet.dart';
import '../../../../../ds/component/dotted_loader.dart';
import '../../../../../ds/component/empty_screen.dart';
import '../../../../../ds/component/spacing.dart';
import '../../../../../utils/xts/global_notifier.dart';
import '../../../../visitor/components/visitor_status_bottomsheet.dart';
import '../components/visitor_list_item.dart';
import 'bloc/visitors_list_screen_bloc.dart';

class VisitorsListScreen extends StatefulWidget {
  final ListType type;

  const VisitorsListScreen({super.key, required this.type});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<VisitorsListScreen> {
  final VisitorsListScreenBloc bloc = GetIt.instance.get();

  final PagingController<int, VisitorDomain> _pagingController =
      PagingController(firstPageKey: 1);

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      bloc.handleUiEvent(OnLoadVisitors(page: pageKey, type: widget.type));
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
      builder: (_, VisitorsListScreenState state) => _screen(context, state),
      listener: (_, VisitorsListScreenState state) {
        PaginatedResult? result = state.visitors?.get();

        if (result != null) {
          List<VisitorDomain> visitors = result.data.isEmpty
              ? <VisitorDomain>[]
              : result.data as List<VisitorDomain>;

          if (result.isLastPage) {
            _pagingController.appendLastPage(visitors);
          } else {
            _pagingController.appendPage(visitors, result.nextPage);
          }
        }

        if (!state.loading) _refreshController.refreshCompleted();

        _pagingController.error = state.error?.get();
      });

  Widget _screen(BuildContext context, VisitorsListScreenState state) =>
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.81,
        child: SmartRefresher(
          onRefresh: () => _pagingController.refresh(),
          controller: _refreshController,
          child: PagedListView(
              pagingController: _pagingController,
              shrinkWrap: true,
              builderDelegate: PagedChildBuilderDelegate<VisitorDomain>(
                  itemBuilder: (_, item, index) {
                    return VisitorListItem(
                      visitor: item,
                      showStatus: widget.type != ListType.upcoming,
                      onTap: () {
                        AppBottomSheet(VisitorStatusBottomSheet(
                          visitor: item,
                        )).show(context);
                      },
                    );
                  },
                  firstPageProgressIndicatorBuilder: (_) => _topLoader(context),
                  newPageProgressIndicatorBuilder: (_) => _loader(context),
                  newPageErrorIndicatorBuilder: (_) => SizedBox(),
                  firstPageErrorIndicatorBuilder: (_) => EmptyScreen(
                        hasError: true,
                        onTryAgain: () {},
                      ),
                  noItemsFoundIndicatorBuilder: (_) => EmptyScreen(
                        onTryAgain: () {},
                      ))),
        ),
      );

  Widget _topLoader(BuildContext context) => Padding(
      padding: EdgeInsets.all(Spacing.extraLarge), child: _loader(context));

  Widget _loader(BuildContext context) => DottedLoader(
        color: context.color.surfaceBright,
        size: 38,
      );
}
