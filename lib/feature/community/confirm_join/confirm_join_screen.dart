import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/feature/home/home_screen.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/street_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../ds/component/app_scrollview.dart';
import '../../../ds/component/app_table_view.dart';
import '../../../ds/component/linear_progress_indicator.dart';
import '../../../ds/component/primary_button.dart';
import '../../../ds/component/spacing.dart';
import '../community_navigator.dart';
import 'bloc/confirm_join_screen_bloc.dart';
import 'components/community_join_overview.dart';

class ConfirmJoinScreen extends AppStatefulWidget {
  final CommunityDomain community;
  final StreetDomain street;
  final String houseNumber;
  final String apartment;

  const ConfirmJoinScreen(
      {super.key,
      required this.community,
      required this.street,
      required this.houseNumber,
      required this.apartment});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ConfirmJoinScreen> {
  final ConfirmJoinScreenBloc _bloc = GetIt.instance.get();

  final CommunityNavigator _communityNavigator = GetIt.instance.get();

  @override
  void initState() {
    super.initState();
    _bloc.init(
        community: widget.community,
        street: widget.street,
        houseNumber: widget.houseNumber,
        apartment: widget.apartment);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: BlocConsumer(
            bloc: _bloc,
            builder: (_, ConfirmJoinScreenState state) =>
                SafeArea(child: _body(context, state)),
            listener: (_, ConfirmJoinScreenState state) {
              widget.handleApiError(context, state.error?.get());

              AccountCommunityDomain? data = state.success?.get();

              if (data != null) {
                widget.showSuccessMessage(
                    title: context.locale.join_success,
                    onDismiss: () {
                      _communityNavigator.toScreen(
                          screen: HomeScreen(), clearStack: true);
                    },
                    message: context.locale.join_success_body);
              }
            }),
      );

  Widget _body(BuildContext context, ConfirmJoinScreenState state) =>
      AppScrollView(
          top: const TLinearProgressIndicator(steps: 3, current: 3),
          body: Padding(
            padding: EdgeInsets.only(
                left: Spacing.small,
                right: Spacing.small,
                top: Spacing.extraSmall),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.locale.confirm_details,
                  style: context.text.headlineSmall,
                ),
                Text(
                  context.locale.confirm_details_body,
                  style: context.text.titleMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.50)),
                ),
                SizedBox(height: Spacing.medium),
                Text(context.locale.section_community,
                    style: context.text.titleMedium),
                SizedBox(height: Spacing.extraSmall),
                CommunityJoinOverview(
                  community: widget.community,
                ),
                SizedBox(height: Spacing.medium),
                Text(context.locale.section_member_address,
                    style: context.text.titleMedium),
                AppTableView(
                  items: [
                    TableItemModel(
                        key: context.locale.street,
                        value: widget.street.name ?? ""),
                    TableItemModel(
                        key: context.locale.body_house_number,
                        value: widget.houseNumber),
                    TableItemModel(
                        key: context.locale.apartment, value: widget.apartment)
                  ],
                ),
                SizedBox(
                  height: Spacing.small,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.locale.use_primary,
                      style: context.text.titleMedium,
                    ),
                    Switch(
                        value: state.isPrimary,
                        onChanged: (x) =>
                            _bloc.handleUiEvent(OnPrimaryChanged(x)))
                  ],
                )
              ],
            ),
          ),
          bottom: PrimaryButton(
            title: context.locale.continue_button,
            loading: state.loading,
            onClick: () => _bloc.handleUiEvent(OnContinueClicked()),
            modifier: EdgeInsets.all(Spacing.small),
          ));
}
