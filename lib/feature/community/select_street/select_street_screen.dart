import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/list_item.dart';
import 'package:tenaid_mobile/ds/component/listitem_loader.dart';
import 'package:tenaid_mobile/library/community/domain/entity/street_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/horizontal_line.dart';
import '../../../ds/component/icon_size.dart';
import '../../../ds/component/spacing.dart';
import '../../../ds/component/text_field.dart';
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

  @override
  void initState() {
    super.initState();
    _bloc.handleUiEvent(OnGetStreets(widget.community));
  }

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: _bloc,
      builder: (_, SelectStreetScreenState state) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
            ),
            body: SafeArea(
              child: _screen(context, state),
            ),
          ),
      listener: (_, SelectStreetScreenState state) {
        widget.handleApiError(context, state.errorMessage?.get());

        StreetDomain? selected = state.itemSelected?.get();
        if (selected != null) {
          widget.onSelected(selected);
          _navigator.back();
        }
      });

  _screen(BuildContext context, SelectStreetScreenState state) =>
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
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              context.locale.select_your_street,
                              style: context.text.headlineSmall,
                            ),
                            GestureDetector(
                              onTap: () {
                                _navigator.back();
                              },
                              child: Assets.cancel.svg(),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Spacing.medium,
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
                          height: Spacing.extraSmall,
                        ),
                      ],
                    ),
                  ),
                  if (state.results.isNotEmpty && !state.loading)
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.results.length,
                        itemBuilder: (_, index) => Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Spacing.small),
                                  child: ListItem(
                                    itemModel: ListItemModel(
                                        icon: Assets.signpost.svg(),
                                        title: state.results[index].name ?? ""),
                                    onClick: (item) {
                                      _bloc.handleUiEvent(OnStreetSelected(
                                          state.results[index]));
                                    },
                                  ),
                                ),
                                HorizontalLine()
                              ],
                            )),
                  if (state.results.isEmpty && !state.loading)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: Spacing.extraExtraLarge),
                        child: Text(
                          context.locale.no_results_found,
                          style: context.text.bodyLarge?.copyWith(
                              color: context.color.onSurface.withOpacity(0.7)),
                        ),
                      ),
                    ),
                  if (state.loading) ListItemLoader(count: 5)
                ],
              ),
            )
          ]))
        ],
      );
}
