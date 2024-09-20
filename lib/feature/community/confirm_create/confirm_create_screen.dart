import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/linear_progress_indicator.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/primary_button.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/feature/community/confirm_create/bloc/confirm_create_bloc.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../ds/component/icon_size.dart';
import '../../../ds/component/image_view.dart';
import '../../../ds/component/list_detail_item.dart';
import '../../../library/community/domain/entity/create_community_param.dart';
import '../../home/home_screen.dart';
import '../community_navigator.dart';

class ConfirmCreateScreen extends AppStatefulWidget {
  final CreateCommunityParam param;

  ConfirmCreateScreen({super.key, required this.param});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ConfirmCreateScreen> {
  final CommunityNavigator navigator = GetIt.instance.get();
  final ConfirmCreateBloc bloc = GetIt.instance.get();

  @override
  void initState() {
    super.initState();
    bloc.handleUiEvent(OnInit(widget.param));
  }

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, ConfirmCreateState state) => Scaffold(
            appBar: AppBar(),
            body: SafeArea(child: _screen(context, state)),
          ),
      listener: (_, ConfirmCreateState state) {
        widget.handleApiError(context, state.error?.get());

        if (state.completed?.get() == true) {
          widget.showSuccessMessage(
              title: context.locale.create_success,
              onDismiss: () {
                navigator.toScreen(screen: HomeScreen(), clearStack: true);
              },
              message: context.locale.create_success_body);
        }
      });

  Widget _screen(BuildContext context, ConfirmCreateState state) =>
      AppScrollView(
          top: TLinearProgressIndicator(steps: 4, current: 4),
          bottom: PrimaryButton(
            title: context.locale.continue_button,
            loading: state.loading,
            onClick: () => bloc.handleUiEvent(OnContinueClicked()),
            modifier: EdgeInsets.all(Spacing.small),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Spacing.small),
                child: PageHeader(
                  title: context.locale.confirm_details,
                  description: context.locale.confirm_details_body,
                  top: Spacing.extraSmall,
                  bottom: Spacing.small,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Spacing.small, vertical: Spacing.medium),
                child: Wrap(
                  spacing: Spacing.small,
                  runSpacing: Spacing.small,
                  children: widget.param.images
                      .map((image) => ImageView(
                            path: image,
                            size: IconSize.extraLargeProfile,
                            url: '',
                          ))
                      .toList(),
                ),
              ),
              ListDetailItem(
                label: 'Community name',
                value: widget.param.name ?? '',
              ),
              ListDetailItem(
                label: 'Community description',
                value: widget.param.description ?? '',
              ),
              ListDetailItem(
                label: 'Address',
                value: widget.param.address?.address ?? '',
              ),
              ListDetailItem(
                label: 'City & Country',
                value:
                    '${widget.param.address?.city}, ${widget.param.address?.country}',
              ),
              ListDetailItem(
                label: 'Community type',
                value: 'Residential',
              )
            ],
          ));
}
