import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:phonecodes/phonecodes.dart';
import 'package:tenaid_mobile/ds/component/asset_icon.dart';
import 'package:tenaid_mobile/ds/component/icon_size.dart';
import 'package:tenaid_mobile/ds/component/list_item.dart';
import 'package:tenaid_mobile/ds/component/text_field.dart';
import 'package:tenaid_mobile/library/account/domain/entity/country_domain.dart';
import 'package:tenaid_mobile/utils/route_utils/base_navigator.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';
import 'package:tenaid_mobile/utils/xts/phone_codes_country_xts.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/spacing.dart';

class SelectCountryScreen extends StatefulWidget {
  final CountryDomain? selected;
  final Function(CountryDomain country) onSelected;

  const SelectCountryScreen(
      {super.key, this.selected, required this.onSelected});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<SelectCountryScreen> {
  List<CountryDomain> _list = Countries.list.map((c) => c.toDomain()).toList();
  List<CountryDomain> _countries =
      Countries.list.map((c) => c.toDomain()).toList();

  final BaseNavigator _navigator = GetIt.instance.get<BaseNavigator>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(child: _screen(context)),
      );

  _screen(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.small),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  context.locale.select_country,
                  style: context.text.headlineSmall,
                ),
                GestureDetector(
                  onTap: () {
                    _navigator.back();
                  },
                  child: AssetIcon(
                      size: IconSize.large, asset: 'assets/cancel.svg'),
                )
              ],
            ),
            SizedBox(
              height: Spacing.medium,
            ),
            TTextField(
              label: context.locale.search_country,
              prefixIcon: Assets.search
                  .svg(width: IconSize.medium.width, fit: BoxFit.scaleDown),
              onChanged: (s) {
                setState(() {
                  _list = _countries
                      .where((country) =>
                          country.code
                              .toLowerCase()
                              .contains(s.toLowerCase()) ||
                          country.name
                              .toLowerCase()
                              .contains(s.toLowerCase()) ||
                          country.dialCode.contains(s))
                      .toList();
                });
              },
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: false,
                    itemCount: _list.length,
                    itemBuilder: (ctx, index) => ListItem(
                          itemModel: _getItem(_list[index]),
                          onClick: (item) {
                            widget.onSelected(_list[index]);
                            _navigator.back();
                          },
                        ))),
          ],
        ),
      );

  _getItem(CountryDomain country) => ListItemModel(
      title: '${country.name} (${country.dialCode})', icon: Text(country.flag));
}
