import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/feature/community/member_address/bloc/member_address_screen_bloc.dart';
import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/app_scrollview.dart';
import '../../../ds/component/icon_size.dart';
import '../../../ds/component/linear_progress_indicator.dart';
import '../../../ds/component/primary_button.dart';
import '../../../ds/component/spacing.dart';
import '../../../ds/component/text_field.dart';
import '../community_navigator.dart';

class MemberAddressScreen extends StatefulWidget {
  final CommunityDomain community;

  const MemberAddressScreen({super.key, required this.community});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MemberAddressScreen> {
  final MemberAddressScreenBloc _bloc = GetIt.instance.get();

  final CommunityNavigator _communityNavigator =
      GetIt.instance.get<CommunityNavigator>();

  final TextEditingController _streetController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: BlocConsumer(
            bloc: _bloc,
            builder: (_, MemberAddressScreenState state) =>
                SafeArea(child: _body(context, state)),
            listener: (_, MemberAddressScreenState state) {
              if (state.selectedStreet != null) {
                _streetController.text = state.selectedStreet?.name ?? "";
              }

              if (state.showConfirmScreen?.get() == true) {
                _communityNavigator.toConfirmJoin(
                    community: widget.community,
                    street: state.selectedStreet!,
                    houseNumber: state.houseNumber!,
                    apartment: state.apartment!);
              }
            }),
      );

  Widget _body(BuildContext context, MemberAddressScreenState state) =>
      AppScrollView(
          top: const TLinearProgressIndicator(steps: 3, current: 2),
          body: Padding(
            padding: EdgeInsets.only(
                left: Spacing.small_w,
                right: Spacing.small_w,
                top: Spacing.extraSmall_h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageHeader(
                  title: context.locale.where_you_live,
                  description: context.locale.where_you_live_body,
                ),
                SizedBox(height: Spacing.medium_h),
                TTextField(
                  controller: _streetController,
                  label: context.locale.select_street,
                  readOnly: true,
                  onTap: () => _communityNavigator
                      .toSelectStreet(widget.community.id ?? "", (s) {
                    _bloc.handleUiEvent(OnStreetSelected(s));
                  }),
                  suffixIcon: Assets.chevronDown
                      .svg(width: IconSize.medium.width, fit: BoxFit.scaleDown),
                ),
                SizedBox(height: Spacing.medium_h),
                TTextField(
                  label: context.locale.house_number,
                  inputType: TextInputType.name,
                  onChanged: (s) {
                    _bloc.handleUiEvent(OnHouseNumberChanged(s));
                  },
                ),
                SizedBox(height: Spacing.medium_h),
                TTextField(
                  label: context.locale.apartment_number,
                  inputType: TextInputType.name,
                  onChanged: (s) {
                    _bloc.handleUiEvent(OnApartmentChanged(s));
                  },
                )
              ],
            ),
          ),
          bottom: PrimaryButton(
            title: context.locale.continue_button,
            enabled: state.validated,
            onClick: () => _bloc.handleUiEvent(OnContinueClicked()),
            modifier: EdgeInsets.symmetric(
                horizontal: Spacing.small_w, vertical: Spacing.small_h),
          ));
}
