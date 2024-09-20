import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/page_loader.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/feature/home/home_navigator.dart';
import 'package:tenaid_mobile/feature/visitor/invite_details/bloc/invite_details_screen_bloc.dart';
import 'package:tenaid_mobile/feature/visitor/visitor_navigator.dart';
import 'package:tenaid_mobile/utils/xts/datetime_xts.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';
import 'package:tenaid_mobile/utils/xts/string.xts.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/list_detail_item.dart';
import '../../../ds/component/mini_button.dart';
import '../../../library/community/domain/entity/invite_domain.dart';
import '../components/invite_code_status.dart';

class InviteDetailsScreen extends AppStatefulWidget {
  final InviteDomain invite;

  InviteDetailsScreen({super.key, required this.invite});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends AppState<InviteDetailsScreen> {
  final InviteDetailsScreenBloc bloc = GetIt.instance.get();
  final VisitorNavigator navigator = GetIt.instance.get();

  @override
  void initState() {
    bloc.handleUiEvent(OnInit(widget.invite));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, InviteDetailsScreenState state) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: GestureDetector(
                onTap: () => navigator.gotoNamed(HomeNavigator.home, context,
                    clearStack: true),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Assets.cancel.svg()],
                ),
              ),
            ),
            body: SafeArea(
                child: state.loading ? PageLoader() : _screen(context, state)),
          ),
      listener: (_, InviteDetailsScreenState state) {});

  Widget _screen(BuildContext context, InviteDetailsScreenState state) =>
      AppScrollView(
          bottom: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Spacing.extraExtraLarge, vertical: Spacing.small),
            child: MiniButton(
              title: 'Share invite',
              icon: Assets.send.svg(color: context.color.surface),
              onClick: () {},
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Spacing.medium,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: QrImageView(data: state.invite!.code),
              ),
              SizedBox(
                height: Spacing.extraSmall,
              ),
              Text(state.invite!.code.asCode,
                  style: context.text.headlineSmall),
              SizedBox(
                height: Spacing.extraSmall,
              ),
              InviteCodeStatus(
                start: state.invite!.startDate,
                end: state.invite!.endDate,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListDetailItem(
                    label: 'Guest name',
                    value: state.invite!.name,
                  ),
                  ListDetailItem(
                    label: 'Valid from',
                    value: state.invite!.startDate.asDateTimeString,
                  ),
                  ListDetailItem(
                    label: 'Expires at',
                    value: state.invite!.endDate.asDateTimeString,
                  ),
                  ListDetailItem(
                    label: 'Purpose of visit',
                    value: state.invite!.purpose!,
                  ),
                  Padding(
                    padding: EdgeInsets.all(Spacing.medium),
                    child: Text(
                      'This is a single guest invite. Please do not share it with anyone else, as it is intended for one guest only.',
                      textAlign: TextAlign.center,
                      style: context.text.labelMedium?.fade(context),
                    ),
                  )
                ],
              )
            ],
          ));
}
