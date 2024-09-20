import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/library/core/domain/entity/place_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/horizontal_line.dart';
import '../../../ds/component/icon_size.dart';
import '../../../ds/component/list_item.dart';
import '../../../ds/component/spacing.dart';
import '../../../ds/component/text_field.dart';
import '../../../ds/component/tlinear_process_indicator.dart';
import '../../../utils/route_utils/base_navigator.dart';
import 'bloc/search_address_screen_bloc.dart';

class SearchAddressScreen extends AppStatefulWidget {
  final Function(PlaceDomain) onSelected;

  SearchAddressScreen(this.onSelected);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<SearchAddressScreen> {
  final BaseNavigator _navigator = GetIt.instance.get<BaseNavigator>();
  final SearchAddressScreenBloc _bloc = GetIt.instance.get();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: _bloc,
      builder: (_, SearchAddressScreenState state) => Scaffold(
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
                child: Stack(
              children: [
                _screen(context, state),
                if (state.loading)
                  Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: TLinearProcessIndicator())
              ],
            )),
          ),
      listener: (_, state) {});

  _screen(BuildContext context, SearchAddressScreenState state) =>
      CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.only(top: Spacing.extraSmall),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Spacing.small),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PageHeader(
                          title: context.locale.search_address,
                          top: Spacing.extraSmall,
                        ),
                        SizedBox(
                          height: Spacing.medium,
                        ),
                        TTextField(
                          label: context.locale.enter_address,
                          inputType: TextInputType.text,
                          autoFocus: true,
                          debounce: Duration(seconds: 1),
                          prefixIcon: Assets.search.svg(
                              width: IconSize.medium.width,
                              fit: BoxFit.scaleDown),
                          onChanged: (s) {
                            if (s.isNotEmpty) _bloc.handleUiEvent(OnSearch(s));
                          },
                        ),
                        SizedBox(
                          height: Spacing.extraSmall,
                        ),
                      ],
                    ),
                  ),
                  if (state.results.isNotEmpty)
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.results.length,
                        itemBuilder: (_, index) {
                          PlaceDomain place = state.results[index];
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Spacing.small),
                                child: ListItem(
                                    onClick: (_) {
                                      widget.onSelected(place);
                                      _navigator.back();
                                    },
                                    itemModel: ListItemModel(
                                        icon: Assets.routeSquare.svg(
                                            height: IconSize.medium.height),
                                        title: place.name ?? "",
                                        description: place.address ?? "")),
                              ),
                              HorizontalLine()
                            ],
                          );
                        })
                  else
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: Spacing.extraExtraLarge),
                        child: Text(
                          context.locale.no_results_found,
                          style: context.text.bodyLarge?.copyWith(
                              color: context.color.onSurface.withOpacity(0.7)),
                        ),
                      ),
                    )
                ],
              ),
            )
          ]))
        ],
      );
}
