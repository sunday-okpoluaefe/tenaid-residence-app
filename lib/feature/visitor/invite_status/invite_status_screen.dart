import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tenaid_mobile/ds/component/primary_button.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/feature/visitor/visitor_navigator.dart';
import 'package:tenaid_mobile/library/community/domain/entity/visitor_domain.dart';
import 'package:tenaid_mobile/utils/xts/datetime_xts.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';
import 'package:tenaid_mobile/utils/xts/string.xts.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/horizontal_line.dart';
import '../../../ds/component/list_detail_item.dart';
import '../../../ds/component/settings_item.dart';
import '../../../utils/pair.dart';
import '../../../utils/xts/status.dart';
import '../components/invite_code_status.dart';
import 'bloc/invite_status_bloc.dart';

class InviteStatusScreen extends StatefulWidget {
  final VisitorDomain visitor;

  InviteStatusScreen({super.key, required this.visitor});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<InviteStatusScreen> {
  final VisitorNavigator navigator = GetIt.instance.get();
  final InviteStatusBloc bloc = GetIt.instance.get();

  @override
  void initState() {
    super.initState();
    bloc.handleUiEvent(OnInit(widget.visitor));
  }

  @override
  Widget build(BuildContext context) {
    Status status =
        Pair(first: widget.visitor.startDate, second: widget.visitor.endDate)
            .status(context);
    return BlocConsumer(
        bloc: bloc,
        builder: (_, InviteStatusState state) => Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: QrImageView(data: widget.visitor.code!),
                ),
                SizedBox(
                  height: Spacing.extraSmall_h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.visitor.code!.asCode,
                      style: context.text.headlineSmall,
                    ),
                    if (widget.visitor.exitOnly == true)
                      Container(
                        margin:
                            EdgeInsets.only(left: Spacing.extraExtraSmall_w),
                        padding: EdgeInsets.symmetric(
                            horizontal: Spacing.extraExtraSmall_w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: context.color.secondaryFixed),
                        child: Text(
                          'Exit Only',
                          style: context.text.labelSmall
                              ?.copyWith(color: context.color.surface),
                        ),
                      )
                  ],
                ),
                SizedBox(
                  height: Spacing.extraExtraSmall_h,
                ),
                InviteCodeStatus(
                  start: widget.visitor.startDate,
                  end: widget.visitor.endDate,
                ),
                SizedBox(
                  height: Spacing.small_h,
                ),
                ListDetailItem(
                  label: 'Guest name',
                  value: widget.visitor.name!,
                ),
                ListDetailItem(
                  label: 'Valid from',
                  value: widget.visitor.startDate.periodDateTimeString,
                ),
                ListDetailItem(
                  label: 'Expires at',
                  value: widget.visitor.endDate.periodDateTimeString,
                ),
                ListDetailItem(
                  label: 'Purpose of visit',
                  value: widget.visitor.reason!,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Spacing.small_w,
                        vertical: Spacing.extraSmall_h),
                    child: Column(
                      children: [
                        SettingsItem(
                          label: 'View details',
                          icon: Assets.task.svg(),
                          onTap: () => navigator.toVisitorDetail(
                              invite: widget.visitor.id ?? ''),
                        ),
                        HorizontalLine(),
                        if (status.title != 'Expired')
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SettingsItem(
                                label: 'Share code',
                                icon: Assets.send.svg(),
                                onTap: () => navigator.toVisitorDetail(
                                    invite: widget.visitor.id ?? ''),
                              ),
                              HorizontalLine(),
                            ],
                          )
                      ],
                    )),
                SizedBox(
                  height: Spacing.small_h,
                ),
                if (status.title == 'Expired')
                  PrimaryButton(
                    title: 'Generate exit code',
                    loading: state.loading,
                    isBottomSheet: true,
                    modifier: EdgeInsets.only(
                        left: Spacing.small_w,
                        right: Spacing.small_w,
                        bottom: Spacing.small_h),
                    onClick: () => bloc.handleUiEvent(OnGenerateExitCode()),
                  ),
              ],
            ),
        listener: (_, InviteStatusState state) {});
  }
}
