import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/icon_size.dart';
import 'package:tenaid_mobile/ds/component/list_item.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/text_field.dart';
import 'package:tenaid_mobile/utils/country_utils/country_utils.dart';
import 'package:tenaid_mobile/utils/country_utils/models/city.dart';
import 'package:tenaid_mobile/utils/route_utils/base_navigator.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/spacing.dart';

class SelectCityScreen extends StatefulWidget {
  final Country country;
  final Function(City city) onSelected;

  const SelectCityScreen(
      {super.key, required this.onSelected, required this.country});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<SelectCityScreen> {
  List<City> _list = [];
  List<City> _cities = [];

  final BaseNavigator _navigator = GetIt.instance.get<BaseNavigator>();

  @override
  void initState() {
    super.initState();

    _list = getCountryCities(widget.country.isoCode);
    _cities = _list;
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
            PageHeader(title: context.locale.select_city),
            SizedBox(
              height: Spacing.medium,
            ),
            TTextField(
              label: context.locale.search_city,
              prefixIcon: Assets.search
                  .svg(width: IconSize.medium.width, fit: BoxFit.scaleDown),
              onChanged: (s) {
                setState(() {
                  _list = _cities
                      .where((city) =>
                          city.name.toLowerCase().contains(s.toLowerCase()))
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

  _getItem(City city) => ListItemModel(
      title: city.name,
      icon: Assets.routeSquare.svg(height: IconSize.medium.height));
}
