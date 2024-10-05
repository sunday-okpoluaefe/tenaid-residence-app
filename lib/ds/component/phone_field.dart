import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/ds/component/text_field.dart';
import 'package:tenaid_mobile/utils/route_utils/base_navigator.dart';

import '../../utils/country_utils/models/country.dart';
import '../../utils/country_utils/utils/country_utils.dart';

class PhoneField extends StatefulWidget {
  final String label;
  final String? error;
  final String? supportText;
  final Country? defaultCountry;
  final String? initialValue;
  final TextEditingController? controller;
  final Function(String) onChanged;
  final Function(Country) onCountrySelected;

  late Country _selectedCountry;

  PhoneField(
      {super.key,
      this.initialValue,
      required this.label,
      this.defaultCountry,
      this.error,
      this.supportText,
      required this.onChanged,
      required this.onCountrySelected,
      this.controller});

  @override
  State<StatefulWidget> createState() {
    _selectedCountry = (defaultCountry ?? getCountryFromName('Nigeria')!);
    return _State();
  }
}

class _State extends State<PhoneField> {
  final BaseNavigator navigator = GetIt.instance.get();
  final TextEditingController _controller = TextEditingController();

  TextEditingController get controller => widget.controller ?? _controller;

  @override
  void didUpdateWidget(covariant PhoneField oldWidget) {
    widget._selectedCountry = oldWidget._selectedCountry;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => TTextField(
      label: widget.label,
      initialValue: widget.initialValue,
      errorText: widget.error,
      controller: controller,
      supportText: widget.supportText,
      inputType: TextInputType.phone,
      prefixIcon: Padding(
        padding: EdgeInsets.only(left: Spacing.small_w),
        child: Row(
          children: [
            Text(
                '${widget._selectedCountry.flag} ${widget._selectedCountry.phoneCode}'),
            const Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
      onPrefixIconClicked: () {
        navigator.toSelectCountry((country) {
          setState(() {
            widget._selectedCountry = country;
            widget.onCountrySelected(country);
            // we need to reformat the phone number
            widget.onChanged(formatNumber(controller.text));
          });
        });
      },
      onChanged: (s) => widget.onChanged(formatNumber(s)),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]);

  String formatNumber(String s) {
    if (s.isEmpty) return s;
    String code = widget._selectedCountry.phoneCode.replaceFirst('+', '');
    String phone = s.replaceFirst(code, '').replaceFirst('0', '');
    return '${widget._selectedCountry.phoneCode}$phone';
  }
}
