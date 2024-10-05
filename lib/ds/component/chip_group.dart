import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class ChipGroup extends StatelessWidget {
  final List<String> choices;
  final String defaultSelected;
  final Function(String choice) onSelectedChanged;
  final WrapAlignment wrapAlignment;
  final WrapCrossAlignment wrapCrossAlignment;

  const ChipGroup(
      {super.key,
      required this.choices,
      this.wrapAlignment = WrapAlignment.start,
      this.wrapCrossAlignment = WrapCrossAlignment.start,
      required this.defaultSelected,
      required this.onSelectedChanged});

  @override
  Widget build(BuildContext context) => Wrap(
        alignment: wrapAlignment,
        crossAxisAlignment: wrapCrossAlignment,
        spacing: Spacing.small_w,
        children: _chips(context),
      );

  List<Widget> _chips(BuildContext context) {
    List<Widget> chips = [];

    for (var choice in choices) {
      bool selected = defaultSelected == choice;
      chips.add(ChoiceChip(
        backgroundColor: context.color.surface,
        padding: EdgeInsets.symmetric(
            horizontal: Spacing.small_w, vertical: Spacing.extraSmall_h),
        label: Text(
          choice,
          style: context.text.bodyMedium?.copyWith(
              color:
                  selected ? context.color.surface : context.color.onSurface),
        ),
        selected: selected,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onSelected: (status) {
          onSelectedChanged(choice);
        },
        selectedColor: context.color.primary,
      ));
    }
    return chips;
  }
}
