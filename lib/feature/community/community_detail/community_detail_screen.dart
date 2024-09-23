import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/primary_button.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/feature/community/community_detail/bloc/community_detail_bloc.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../ds/component/detail_text.dart';
import '../../../ds/component/info_text.dart';
import '../../../ds/component/page_header.dart';
import 'components/admin_detail_screen.dart';
import 'components/member_detail_screen.dart';

class CommunityDetailScreen extends AppStatefulWidget {
  final AccountCommunityDomain community;

  CommunityDetailScreen({super.key, required this.community});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CommunityDetailScreen> {
  final CommunityDetailBloc bloc = GetIt.instance.get();

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, CommunityDetailState state) => Scaffold(
            appBar: AppBar(),
            body: SafeArea(
                child: AppScrollView(
                    bottom: widget.community.isPrimary != true &&
                            widget.community.status == 'approved'
                        ? PrimaryButton(
                            title: 'Set as primary',
                            onClick: () {},
                            modifier: EdgeInsets.all(Spacing.small),
                          )
                        : SizedBox.shrink(),
                    body: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Spacing.small),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PageHeader(
                                title: widget.community.community!.name ?? '',
                                description:
                                    widget.community.community!.description ??
                                        '',
                              ),
                              SizedBox(
                                height: Spacing.medium,
                              ),
                              DetailText(
                                  label: context.locale.address,
                                  detail: widget.community.community?.address
                                          ?.address ??
                                      ''),
                              SizedBox(
                                height: Spacing.small,
                              ),
                              DetailText(
                                  label:
                                      '${context.locale.city} & ${context.locale.country}',
                                  detail:
                                      '${widget.community.community?.address?.city}, ${widget.community.community?.address?.country}'),
                            ],
                          ),
                        ),
                        if (widget.community.isAdmin == true &&
                            widget.community.status == 'approved')
                          AdminDetailsScreen()
                        else if (widget.community.isAdmin != true &&
                            widget.community.status == 'approved')
                          MemberDetailScreen(
                            community: widget.community,
                          ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Spacing.small),
                          child: Column(
                            children: [
                              SizedBox(
                                height: Spacing.medium,
                              ),
                              if (widget.community.isPrimary == true)
                                Padding(
                                  padding:
                                      EdgeInsets.only(bottom: Spacing.small),
                                  child: InfoText(
                                      title: 'This is your primary community'),
                                ),
                              if (widget.community.status == 'pending')
                                InfoText(
                                  title:
                                      'Your membership is being reviewed. We will let you know once the status changes',
                                )
                            ],
                          ),
                        )
                      ],
                    ))),
          ),
      listener: (_, CommunityDetailState state) {});
}
