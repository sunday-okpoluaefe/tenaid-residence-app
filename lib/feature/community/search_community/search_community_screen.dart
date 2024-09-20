import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/tlinear_process_indicator.dart';
import 'package:tenaid_mobile/feature/community/search_community/bloc/search_community_screen_bloc.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/horizontal_line.dart';
import '../../../ds/component/icon_size.dart';
import '../../../ds/component/spacing.dart';
import '../../../ds/component/text_field.dart';
import '../../../library/community/domain/entity/community_domain.dart';
import '../../../utils/route_utils/base_navigator.dart';
import 'components/community_list_item.dart';

class SearchCommunityScreen extends StatefulWidget {
  final Function(CommunityDomain) onSelected;

  const SearchCommunityScreen({super.key, required this.onSelected});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<SearchCommunityScreen> {
  final BaseNavigator _navigator = GetIt.instance.get<BaseNavigator>();
  final SearchCommunityScreenBloc _bloc = GetIt.instance.get();

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: _bloc,
      builder: (_, SearchCommunityScreenState state) => Scaffold(
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

  _screen(BuildContext context, SearchCommunityScreenState state) =>
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
                        PageHeader(title: context.locale.search_your_community),
                        SizedBox(
                          height: Spacing.medium,
                        ),
                        TTextField(
                          label: context.locale.search_community,
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
                        itemBuilder: (_, index) => Column(
                              children: [
                                CommunityListItem(
                                  community: state.results[index],
                                  onTap: (community) {
                                    widget.onSelected(community);
                                    _navigator.back();
                                  },
                                ),
                                HorizontalLine()
                              ],
                            ))
                  else
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: Spacing.extraExtraLarge),
                        child: Text(
                          'No results found',
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
