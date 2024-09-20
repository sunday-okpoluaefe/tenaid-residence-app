import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/assets/assets.gen.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/linear_progress_indicator.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/primary_button.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/ds/component/text_field.dart';
import 'package:tenaid_mobile/feature/community/community_navigator.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../library/community/domain/entity/create_community_param.dart';
import 'bloc/community_address_bloc.dart';

class CommunityAddressScreen extends StatefulWidget {
  final CreateCommunityParam param;

  const CommunityAddressScreen({super.key, required this.param});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CommunityAddressScreen> {
  final CommunityAddressBloc bloc = GetIt.instance.get();
  final CommunityNavigator navigator = GetIt.instance.get();

  final TextEditingController addressController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  String? countryError;

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, CommunityAddressState state) => Scaffold(
            appBar: AppBar(),
            body: _screen(context, state),
          ),
      listener: (_, CommunityAddressState state) {
        countryController.text = state.selectedCountry?.name ?? '';
        cityController.text = state.selectedCity?.name ?? '';
        addressController.text = state.place?.address ?? '';
      });

  Widget _screen(BuildContext context, CommunityAddressState state) =>
      AppScrollView(
          top: TLinearProgressIndicator(steps: 4, current: 2),
          bottom: PrimaryButton(
            title: context.locale.continue_button,
            enabled: state.selectedCity != null &&
                state.selectedCountry != null &&
                state.place != null,
            onClick: () {
              navigator.toCommunityImage(
                  param: widget.param.copyWith(address: state.address));
            },
            modifier: EdgeInsets.all(Spacing.small),
          ),
          body: Padding(
            padding: EdgeInsets.only(
                left: Spacing.small,
                right: Spacing.small,
                top: Spacing.extraSmall),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageHeader(
                  title: context.locale.community_address_title,
                  description: context.locale.community_address_body,
                  top: Spacing.extraSmall,
                ),
                SizedBox(
                  height: Spacing.medium,
                ),
                TTextField(
                  label: 'Enter community address',
                  controller: addressController,
                  readOnly: true,
                  onTap: () {
                    navigator.toSearchAddress(
                        (x) => bloc.handleUiEvent(OnAddressChanged(x)));
                  },
                  suffixIcon: Assets.chevronDown.svg(fit: BoxFit.scaleDown),
                ),
                SizedBox(
                  height: Spacing.small,
                ),
                TTextField(
                    label: 'Select country',
                    controller: countryController,
                    readOnly: true,
                    errorText: countryError,
                    onTap: () {
                      navigator.toSelectCountry((c) {
                        setState(() {
                          countryError = null;
                        });
                        bloc.handleUiEvent(OnCountrySelected(c));
                      });
                    },
                    suffixIcon: Assets.chevronDown.svg(fit: BoxFit.scaleDown)),
                SizedBox(
                  height: Spacing.small,
                ),
                TTextField(
                    label: 'Select city',
                    controller: cityController,
                    readOnly: true,
                    onTap: () {
                      if (state.selectedCountry == null) {
                        setState(() {
                          countryError = 'Select a country';
                        });
                      } else
                        navigator.toSelectCity(
                            onSelected: (c) =>
                                bloc.handleUiEvent(OnCitySelected(c)),
                            country: state.selectedCountry!);
                    },
                    suffixIcon: Assets.chevronDown.svg(fit: BoxFit.scaleDown))
              ],
            ),
          ));
}
