import 'package:flutter/material.dart';

class AppScrollView extends StatelessWidget {
  final Widget? top;
  final Widget body;
  final Widget? bottom;

  const AppScrollView({super.key, this.top, required this.body, this.bottom});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (top != null) top!,
        Expanded(
            child: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate([body])),
            if (bottom != null)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    bottom!,
                  ],
                ),
              )
          ],
        ))
      ],
    );
  }
}
