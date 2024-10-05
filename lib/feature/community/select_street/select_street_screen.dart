import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/horizontal_line.dart';
import 'package:tenaid_mobile/ds/component/list_item.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/library/community/domain/entity/street_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/dotted_loader.dart';
import '../../../ds/component/empty_screen.dart';
import '../../../ds/component/icon_size.dart';
import '../../../ds/component/spacing.dart';
import '../../../ds/component/text_field.dart';
import '../../../library/core/domain/entity/paginated_result.dart';
import '../../../utils/route_utils/base_navigator.dart';
import 'bloc/select_street_screen_bloc.dart';

class SelectStreetScreen extends AppStatefulWidget {
  final String community;
  final Function(StreetDomain) onSelected;

  const SelectStreetScreen(
      {super.key, required this.community, required this.onSelected});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<SelectStreetScreen> {
  final BaseNavigator _navigator = GetIt.instance.get<BaseNavigator>();
  final SelectStreetScreenBloc _bloc = GetIt.instance.get();

  final PagingController<int, StreetDomain> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener((pageKey) {
      _bloc.handleUiEvent(
          OnGetStreets(community: widget.community, page: pageKey, limit: 10));
    });
  }

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: _bloc,
      builder: (_, SelectStreetScreenState state) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      _navigator.back();
                    },
                    child: Assets.cancel.svg(),
                  )
                ],
              ),
            ),
            body: SafeArea(
              child: _screen(context, state),
            ),
          ),
      listener: (_, SelectStreetScreenState state) {
        StreetDomain? selected = state.itemSelected?.get();
        if (selected != null) {
          widget.onSelected(selected);
          _navigator.back();
        }

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

  _screen(BuildContext context, SelectStreetScreenState state) =>
      CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.only(top: Spacing.extraSmall_h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Spacing.small_w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PageHeader(title: context.locale.select_your_street),
                        SizedBox(
                          height: Spacing.medium_h,
                        ),
                        TTextField(
                          label: context.locale.search_street,
                          inputType: TextInputType.text,
                          debounce: Duration(seconds: 1),
                          prefixIcon: Assets.search.svg(
                              width: IconSize.medium.width,
                              fit: BoxFit.scaleDown),
                          onChanged: (s) {
                            // if (s.isNotEmpty) _bloc.handleUiEvent(OnSearch(s));
                          },
                        ),
                        SizedBox(
                          height: Spacing.small_h,
                        ),
                      ],
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
                                    horizontal: Spacing.small_w),
                                child: ListItem(
                                  itemModel: ListItemModel(
                                      icon: Assets.signpost.svg(height: 24),
                                      title: street.name ?? ""),
                                  onClick: (item) {
                                    _bloc.handleUiEvent(
                                        OnStreetSelected(street));
                                  },
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
                                  onTryAgain: () => _pagingController.refresh(),
                                )),
                        separatorBuilder: (BuildContext context, int index) =>
                            HorizontalLine(),
                      )),
                ],
              ),
            )
          ]))
        ],
      );
}
