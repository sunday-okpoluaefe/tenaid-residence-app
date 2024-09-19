import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../ds/component/asset_icon.dart';
import '../../../ds/component/icon_size.dart';
import '../../../ds/component/primary_button.dart';
import '../../../ds/component/spacing.dart';
import '../../../ds/component/text_field.dart';
import 'bloc/forgot_password_screen_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<ForgotPasswordScreen> {
  final _bloc = ForgotPasswordScreenBloc();

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: BlocConsumer(
            bloc: _bloc,
            builder: (_, state) => SafeArea(child: _screen(context)),
            listener: (_, state) {}),
      );

  _screen(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.small),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.locale.forgot_password_title,
                  style: context.text.headlineSmall,
                ),
                Text(
                  context.locale.forgot_password_body,
                  style: context.text.titleMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.50)),
                ),
                SizedBox(
                  height: Spacing.medium,
                ),
                TTextField(
                  label: context.locale.email_address,
                  prefixIcon:
                      AssetIcon(size: IconSize.medium, asset: 'assets/sms.svg'),
                )
              ],
            ),
            PrimaryButton(
                title: context.locale.continue_button,
                modifier: EdgeInsets.symmetric(vertical: Spacing.small),
                onClick: () {})
          ],
        ),
      );
}
