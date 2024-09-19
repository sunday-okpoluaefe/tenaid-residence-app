import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/primary_button.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../assets/assets.gen.dart';
import '../../utils/route_utils/base_navigator.dart';
import 'app_bottom_sheet.dart';

enum MessageType { error, success, warning }

class MessageBottomSheet {
  final String? title;
  final MessageType? type;
  final String message;
  final bool dismissible;
  final String primaryButtonText;
  final String? secondaryButtonText;
  final Function() primaryButtonClicked;
  final Function()? secondaryButtonClicked;
  final Function()? onDismiss;

  const MessageBottomSheet(
      {this.title,
      this.onDismiss,
      this.type,
      this.dismissible = true,
      required this.message,
      required this.primaryButtonText,
      this.secondaryButtonText,
      required this.primaryButtonClicked,
      this.secondaryButtonClicked});

  void show(BuildContext context) {
    AppBottomSheet(
            _Sheet(
                key: Key(message),
                message: message,
                type: type,
                primaryButtonText: primaryButtonText,
                primaryButtonClicked: primaryButtonClicked,
                secondaryButtonClicked: secondaryButtonClicked,
                secondaryButtonText: secondaryButtonText),
            title: title)
        .show(context, onDismiss: onDismiss, dismissible: dismissible);
  }
}

class _Sheet extends StatelessWidget {
  final MessageType? type;
  final String message;
  final String primaryButtonText;
  final String? secondaryButtonText;
  final Function() primaryButtonClicked;
  final Function()? secondaryButtonClicked;

  final BaseNavigator _navigator = GetIt.instance.get<BaseNavigator>();

  _Sheet(
      {super.key,
      required this.message,
      required this.primaryButtonText,
      this.secondaryButtonText,
      required this.primaryButtonClicked,
      this.secondaryButtonClicked,
      this.type});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
            left: Spacing.small, right: Spacing.small, bottom: Spacing.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            type != null ? _icon(type!) : Container(),
            SizedBox(
              height: Spacing.small,
            ),
            Text(
              message,
              style: context.text.bodyMedium
                  ?.copyWith(color: context.color.onSurface.withOpacity(0.8)),
            ),
            SizedBox(
              height: Spacing.small,
            ),
            PrimaryButton(
                title: primaryButtonText,
                isBottomSheet: true,
                onClick: () {
                  _navigator.back();
                  primaryButtonClicked();
                })
          ],
        ),
      );

  Widget _icon(MessageType type) => switch (type) {
        MessageType.error => Assets.error.svg(),
        MessageType.success => Assets.success.svg(),
        MessageType.warning => Assets.warning.svg(),
      };
}
