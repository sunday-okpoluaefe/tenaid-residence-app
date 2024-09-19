import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../utils/route_utils/base_navigator.dart';

class AppBottomSheet {
  final String? title;
  final Color backgroundColor;
  final Widget child;

  final BaseNavigator _navigator = GetIt.instance.get<BaseNavigator>();

  AppBottomSheet(this.child, {this.title, this.backgroundColor = Colors.white});

  void show(BuildContext context, {bool? dismissible, Function()? onDismiss}) {
    showModalBottomSheet(
        context: context,
        isDismissible: dismissible ?? true,
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        isScrollControlled: true,
        builder: (_) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(15.0))),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Spacing.small, horizontal: Spacing.small),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title ?? '',
                          style: context.text.titleLarge,
                        ),
                        GestureDetector(
                          onTap: () {
                            _navigator.back();
                            if (onDismiss != null) onDismiss();
                          },
                          child: SvgPicture.asset('assets/cancel.svg'),
                        )
                      ],
                    ),
                  ),
                  child
                ],
              ),
            ),
          );
        });
  }
}
