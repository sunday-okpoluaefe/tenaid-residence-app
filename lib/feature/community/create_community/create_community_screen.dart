import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/linear_progress_indicator.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/primary_button.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/ds/component/text_field.dart';
import 'package:tenaid_mobile/feature/community/community_navigator.dart';
import 'package:tenaid_mobile/feature/community/create_community/bloc/create_community_bloc.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../library/community/domain/entity/create_community_param.dart';

class CreateCommunityScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CreateCommunityScreen> {
  final CreateCommunityBloc bloc = GetIt.instance.get();
  final CommunityNavigator navigator = GetIt.instance.get();

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, CreateCommunityState state) => Scaffold(
            appBar: AppBar(),
            body: _screen(context, state),
          ),
      listener: (_, CreateCommunityState state) {});

  Widget _screen(BuildContext context, CreateCommunityState state) =>
      AppScrollView(
          top: TLinearProgressIndicator(steps: 4, current: 1),
          bottom: PrimaryButton(
            title: context.locale.continue_button,
            enabled: state.name?.isNotEmpty == true &&
                state.description?.isNotEmpty == true,
            onClick: () => navigator.toCommunityAddress(
                param: CreateCommunityParam(
                    name: state.name, description: state.description)),
            modifier: EdgeInsets.all(Spacing.small),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.small),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageHeader(
                  title: context.locale.create_community,
                  description: context.locale.create_community_body,
                  top: Spacing.extraSmall,
                ),
                SizedBox(
                  height: Spacing.medium,
                ),
                TTextField(
                  label: 'Give your community name',
                  onChanged: (s) => bloc.handleUiEvent(OnNamedChanged(s)),
                  inputType: TextInputType.name,
                ),
                SizedBox(
                  height: Spacing.medium,
                ),
                TTextField(
                    label: 'Say something about your community',
                    onChanged: (s) =>
                        bloc.handleUiEvent(OnDescriptionChanged(s)),
                    inputType: TextInputType.name)
              ],
            ),
          ));
}
