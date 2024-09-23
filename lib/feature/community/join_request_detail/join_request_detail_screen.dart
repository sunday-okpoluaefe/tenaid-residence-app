import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/horizontal_line.dart';
import 'package:tenaid_mobile/ds/component/icon_size.dart';
import 'package:tenaid_mobile/ds/component/page_loader.dart';
import 'package:tenaid_mobile/ds/component/primary_button.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/feature/community/community_navigator.dart';
import 'package:tenaid_mobile/feature/community/join_request_detail/bloc/join_request_detail_bloc.dart';
import 'package:tenaid_mobile/library/community/domain/entity/join_request_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/app_table_view.dart';
import '../../../ds/component/secondary_button.dart';
import '../../../utils/xts/global_notifier.dart';
import '../../home/components/profile_image.dart';

class JoinRequestDetailScreen extends AppStatefulWidget {
  final JoinRequestDomain? request;
  final String? requestId;

  JoinRequestDetailScreen({super.key, this.request, this.requestId});

  @override
  State<StatefulWidget> createState() {
    if (request == null && requestId == null)
      throw new Exception('You must provide either request or requestId');
    return _State();
  }
}

class _State extends State<JoinRequestDetailScreen> {
  final JoinRequestDetailBloc bloc = GetIt.instance.get();
  final CommunityNavigator navigator = GetIt.instance.get();

  @override
  void initState() {
    super.initState();

    bloc.handleUiEvent(
        OnInit(requestDetail: widget.request, request: widget.requestId));
  }

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, JoinRequestDetailState state) => Scaffold(
            appBar: AppBar(),
            body: SafeArea(
                child: state.loading ? PageLoader() : _screen(context, state)),
          ),
      listener: (_, JoinRequestDetailState state) {
        widget.handleApiError(context, state.error?.get(), onDismiss: () {
          navigator.back();
        });

        if (state.completed?.get() == true) {
          widget.showSuccessMessage(
              message: 'The join request has be approved successfully',
              title: 'Approval Successful',
              onDismiss: () {
                syncRequiredNotifier.notify();
                navigator.goBack(context);
              });
        }
      });

  Widget _screen(BuildContext context, JoinRequestDetailState state) =>
      AppScrollView(
          bottom: Padding(
            padding: EdgeInsets.all(Spacing.small),
            child: Column(
              children: [
                PrimaryButton(
                  title: 'Approve',
                  loading: state.approving,
                  onClick: () => bloc.handleUiEvent(OnApproveRequest()),
                  modifier: EdgeInsets.only(bottom: Spacing.small),
                ),
                SecondaryButton(
                  title: 'Decline',
                  onClick: () => navigator.toConfirmRequestDecline(
                      request: state.requestDetail!),
                )
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Spacing.small,
                    right: Spacing.small,
                    bottom: Spacing.small),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            '${state.requestDetail?.account?.name}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.text.headlineSmall,
                          ),
                        ),
                        //
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Assets.location.svg(),
                            SizedBox(
                              width: Spacing.extraSmall,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                  '${state.requestDetail?.community?.name}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      context.text.bodyMedium?.fade(context)),
                            )
                          ],
                        ),
                        //
                      ],
                    ),
                    Stack(
                      children: [
                        ProfileImage(
                          path: '${state.requestDetail?.account?.photo}',
                          size: IconSize.extraLargeProfile,
                        ),
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: context.color.primary, width: 1)),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              HorizontalLine(),
              Padding(
                padding: EdgeInsets.all(Spacing.small),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.locale.address,
                        style: context.text.titleMedium),
                    SizedBox(
                      height: Spacing.extraExtraSmall,
                    ),
                    AppTableView(
                      items: [
                        TableItemModel(
                            key: context.locale.street,
                            value: '${state.requestDetail?.street?.name}'),
                        TableItemModel(
                            key: context.locale.body_house_number,
                            value: '${state.requestDetail?.point}'),
                        TableItemModel(
                            key: context.locale.apartment,
                            value: '${state.requestDetail?.description}')
                      ],
                    ),
                    SizedBox(
                      height: Spacing.medium,
                    ),
                    Text('About ${state.requestDetail?.account?.firstName}',
                        style: context.text.titleMedium),
                    SizedBox(
                      height: Spacing.extraExtraSmall,
                    ),
                    AppTableView(
                      items: [
                        TableItemModel(
                            key: 'Email address',
                            value:
                                '${state.requestDetail?.account?.email?.value}'),
                        TableItemModel(
                            key: context.locale.phone_number,
                            value: '${state.requestDetail?.account?.phone}'),
                        TableItemModel(
                            key: context.locale.country,
                            value: '${state.requestDetail?.account?.country}')
                      ],
                    ),
                  ],
                ),
              )
            ],
          ));
}
