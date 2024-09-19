import 'package:flutter/material.dart';
import 'package:tenaid_mobile/assets/assets.gen.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class BottomBar extends StatelessWidget {
  final int selected;
  final Function(int index) onTap;

  const BottomBar({super.key, required this.onTap, required this.selected});

  @override
  Widget build(BuildContext context) => NavigationBar(
        onDestinationSelected: onTap,
        selectedIndex: selected,
        backgroundColor: context.color.surface,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Assets.navHome.svg(color: context.color.primary),
            icon: Assets.navHome.svg(),
            label: context.locale.nav_home,
          ),
          NavigationDestination(
            selectedIcon: Badge(
                child: Assets.navMessage.svg(color: context.color.primary)),
            icon: Badge(child: Assets.navMessage.svg()),
            label: context.locale.nav_message,
          ),
          NavigationDestination(
            icon: Assets.navPayment.svg(),
            selectedIcon: Assets.navPayment.svg(color: context.color.primary),
            label: context.locale.nav_payment,
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Assets.visitors.svg(),
            ),
            selectedIcon: Badge(
              label: Text('2'),
              child: Assets.visitors.svg(color: context.color.primary),
            ),
            label: context.locale.nav_visitor,
          ),
        ],
      );
}
