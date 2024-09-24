import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/dotted_loader.dart';
import '../../../ds/component/empty_screen.dart';
import '../../../ds/component/list_item.dart';
import '../../../ds/component/page_header.dart';
import '../../../ds/component/spacing.dart';
import '../../../library/community/domain/entity/street_domain.dart';
import '../../../library/core/domain/entity/paginated_result.dart';
import 'bloc/community_street_bloc.dart';

class CommunityStreetScreen extends StatefulWidget {
  final String community;

  const CommunityStreetScreen({super.key, required this.community});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CommunityStreetScreen> {
  final CommunityStreetBloc _bloc = GetIt.instance.get();

  final PagingController<int, StreetDomain> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener((pageKey) {
      _bloc.handleUiEvent(
          OnLoadStreets(community: widget.community, page: pageKey, limit: 10));
    });
  }

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: _bloc,
      builder: (_, CommunityStreetState state) => Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: _screen(context, state),
            ),
          ),
      listener: (_, CommunityStreetState state) {
        PaginatedResult? result = state.results?.get();

        if (result != null) {
          List<StreetDomain> visitors = result.data.isEmpty
              ? <StreetDomain>[]
              : result.data as List<StreetDomain>;

          if (result.isLastPage) {
            _pagingController.appendLastPage(visitors);
          } else {
            _pagingController.appendPage(visitors, result.nextPage);
          }
        }

        _pagingController.error = state.errorMessage?.get();
      });

  _screen(BuildContext context, CommunityStreetState state) => CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.only(top: Spacing.extraSmall),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Spacing.small),
                    child: PageHeader(
                      title: context.locale.streets,
                      bottom: Spacing.small,
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: PagedListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        pagingController: _pagingController,
                        shrinkWrap: true,
                        builderDelegate: PagedChildBuilderDelegate<
                                StreetDomain>(
                            itemBuilder: (_, street, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Spacing.small),
                                child: ListItem(
                                  itemModel: ListItemModel(
                                      icon: Assets.signpost.svg(height: 24),
                                      title: street.name ?? ""),
                                ),
                              );
                            },
                            firstPageProgressIndicatorBuilder: (_) =>
                                topLoader(context),
                            newPageProgressIndicatorBuilder: (_) =>
                                loader(context),
                            newPageErrorIndicatorBuilder: (_) => SizedBox(),
                            firstPageErrorIndicatorBuilder: (_) => EmptyScreen(
                                  hasError: true,
                                  onTryAgain: () => _pagingController.refresh(),
                                ),
                            noItemsFoundIndicatorBuilder: (_) => EmptyScreen(
                                  retryTitle: 'Add street',
                                  onTryAgain: () => _pagingController.refresh(),
                                )),
                        separatorBuilder: (BuildContext context, int index) =>
                            Container(
                          height: Spacing.extraSmall,
                          color: context.color.surfaceContainer,
                        ),
                      )),
                ],
              ),
            )
          ]))
        ],
      );
}
