import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../ds/component/app_scrollview.dart';
import '../../../ds/component/page_header.dart';
import '../../../ds/component/primary_button.dart';
import '../../../ds/component/spacing.dart';
import '../../../ds/component/text_field.dart';
import '../community_navigator.dart';
import 'bloc/create_community_street_bloc.dart';

class CreateCommunityStreetScreen extends AppStatefulWidget {
  final String community;

  CreateCommunityStreetScreen(this.community);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CreateCommunityStreetScreen> {
  final CreateCommunityStreetBloc bloc = GetIt.instance.get();
  final CommunityNavigator navigator = GetIt.instance.get();

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, CreateCommunityStreetState state) => Scaffold(
            appBar: AppBar(),
            body: SafeArea(child: _screen(context, state)),
          ),
      listener: (_, CreateCommunityStreetState state) {
        widget.handleApiError(context, state.error?.get());

        if (state.completed?.get() == true)
          widget.showSuccessMessage(
              message: 'Street has been add to your community successfully',
              title: 'Success',
              onDismiss: () => navigator.back());
      });

  Widget _screen(BuildContext context, CreateCommunityStreetState state) =>
      AppScrollView(
          bottom: PrimaryButton(
            title: context.locale.continue_button,
            loading: state.loading,
            enabled: state.description.isNotEmpty && state.name.isNotEmpty,
            onClick: () =>
                bloc.handleUiEvent(OnContinueClicked(widget.community)),
            modifier: EdgeInsets.symmetric(
                horizontal: Spacing.small_w, vertical: Spacing.small_h),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.small_w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageHeader(
                  title: 'Create a street',
                  description: 'Add a street to your community',
                  bottom: Spacing.medium_h,
                ),
                TTextField(
                  label: 'Street name - e.g Indigo street',
                  onChanged: (x) => bloc.handleUiEvent(OnNameChanged(name: x)),
                ),
                SizedBox(
                  height: Spacing.small_h,
                ),
                TTextField(
                  label: 'Description',
                  supportText: 'Describe your street',
                  onChanged: (x) =>
                      bloc.handleUiEvent(OnDescriptionChanged(description: x)),
                ),
              ],
            ),
          ));
}
