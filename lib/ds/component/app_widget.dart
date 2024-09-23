import 'package:flutter/material.dart';
import 'package:tenaid_mobile/app.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import 'message_bottom_sheet.dart';

abstract class AppStatefulWidget extends StatefulWidget {
  const AppStatefulWidget({super.key});

  void showErrorMessage({required String error, String? title}) =>
      showMessage(message: error, type: MessageType.error, title: title);

  void showSuccessMessage(
          {required String message, String? title, Function()? onDismiss}) =>
      showMessage(
          message: message,
          type: MessageType.success,
          title: title,
          onDismiss: onDismiss);

  void handleApiError(BuildContext context, ApiException? error,
      {Function()? onDismiss}) {
    if (error == null) return;

    String? message =
        (error is NetworkError) ? context.locale.network_error : error.message;

    showMessage(
        message: message ?? "",
        title: context.locale.error,
        type: MessageType.error,
        onDismiss: onDismiss);
  }

  void showMessage(
      {required String message,
      required MessageType type,
      bool dismissible = true,
      String? title,
      Function()? onDismiss}) {
    BuildContext? context = navigatorKey.currentContext;
    if (context != null) {
      MessageBottomSheet(
          title: title,
          type: type,
          message: message,
          dismissible: dismissible,
          onDismiss: onDismiss,
          primaryButtonText: context.locale.button_ok,
          primaryButtonClicked: () {
            if (onDismiss != null) onDismiss();
          }).show(context);
    }
  }
}

abstract class AppState<T extends StatefulWidget> extends State<T> {
  // to be created
}
