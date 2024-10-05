import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/primary_button.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/ds/component/text_field.dart';
import 'package:tenaid_mobile/feature/community/add_access_point/bloc/add_access_point_bloc.dart';
import 'package:tenaid_mobile/feature/community/community_navigator.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class AddAccessPointScreen extends AppStatefulWidget {
  final String community;

  AddAccessPointScreen(this.community);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<AddAccessPointScreen> {
  final AddAccessPointBloc bloc = GetIt.instance.get();
  final CommunityNavigator navigator = GetIt.instance.get();

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, AddAccessPointState state) => Scaffold(
            appBar: AppBar(),
            body: SafeArea(child: _screen(context, state)),
          ),
      listener: (_, AddAccessPointState state) {
        widget.handleApiError(context, state.error?.get());

        if (state.completed?.get() == true) navigator.back();
      });

  Widget _screen(BuildContext context, AddAccessPointState state) =>
      AppScrollView(
          bottom: PrimaryButton(
            title: context.locale.continue_button,
            loading: state.loading,
            enabled: state.password.isNotEmpty &&
                state.description.isNotEmpty &&
                state.name.isNotEmpty,
            onClick: () => bloc
                .handleUiEvent(OnContinueClicked(community: widget.community)),
            modifier: EdgeInsets.symmetric(
                horizontal: Spacing.small_w, vertical: Spacing.small_h),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.small_w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageHeader(
                  title: 'Create access point',
                  description: 'Create an entry or exit to your community',
                  bottom: Spacing.medium_h,
                ),
                TTextField(
                  label: 'Access name - e.g Main Gate',
                  onChanged: (x) => bloc.handleUiEvent(OnNamedChanged(name: x)),
                ),
                SizedBox(
                  height: Spacing.small_h,
                ),
                TTextField(
                  label: 'Description',
                  supportText: 'Describe your access point',
                  onChanged: (x) =>
                      bloc.handleUiEvent(OnDescriptionChanged(description: x)),
                ),
                SizedBox(
                  height: Spacing.small_h,
                ),
                TTextField(
                  label: 'Password',
                  isSecret: true,
                  supportText: 'Required for login',
                  onChanged: (x) =>
                      bloc.handleUiEvent(OnPasswordChanged(password: x)),
                )
              ],
            ),
          ));
}
