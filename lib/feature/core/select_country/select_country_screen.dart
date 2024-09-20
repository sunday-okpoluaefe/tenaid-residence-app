import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/icon_size.dart';
import 'package:tenaid_mobile/ds/component/list_item.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/text_field.dart';
import 'package:tenaid_mobile/utils/route_utils/base_navigator.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/spacing.dart';
import '../../../utils/country_utils/models/country.dart';
import '../../../utils/country_utils/utils/country_utils.dart';

class SelectCountryScreen extends StatefulWidget {
  final Country? selected;
  final Function(Country country) onSelected;

  const SelectCountryScreen(
      {super.key, this.selected, required this.onSelected});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<SelectCountryScreen> {
  List<Country> _list = getAllCountries();
  List<Country> _countries = getAllCountries();

  final BaseNavigator _navigator = GetIt.instance.get<BaseNavigator>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  _navigator.back();
                },
                child: Assets.cancel.svg(),
              )
            ],
          ),
        ),
        body: SafeArea(child: _screen(context)),
      );

  _screen(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(title: context.locale.select_country),
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
                          country.isoCode
                              .toLowerCase()
                              .contains(s.toLowerCase()) ||
                          country.name
                              .toLowerCase()
                              .contains(s.toLowerCase()) ||
                          country.phoneCode.contains(s))
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

  _getItem(Country country) => ListItemModel(
      title: '${country.name} (${country.phoneCode})',
      icon: Text(country.flag));
}
