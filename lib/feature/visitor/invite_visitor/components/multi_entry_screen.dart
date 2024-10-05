import 'package:flutter/material.dart';
import 'package:tenaid_mobile/utils/xts/datetime_xts.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../assets/assets.gen.dart';
import '../../../../ds/component/spacing.dart';
import '../../../../ds/component/text_field.dart';
import '../bloc/invite_visitor_screen_bloc.dart';

class MultiEntryScreen extends StatefulWidget {
  final InviteVisitorScreenState? state;
  final Function(String) onNameChanged;
  final Function(String) onPurposeChanged;
  final Function(DateTime) onStartDateChanged;
  final Function(DateTime) onEndDateChanged;
  final bool dateError;

  const MultiEntryScreen(
      {super.key,
      this.state,
      this.dateError = false,
      required this.onNameChanged,
      required this.onPurposeChanged,
      required this.onStartDateChanged,
      required this.onEndDateChanged});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MultiEntryScreen> {
  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.state != null) {
      if (widget.state?.name != null) nameController.text = widget.state!.name!;
      if (widget.state?.purpose != null)
        purposeController.text = widget.state!.purpose!;
      if (widget.state?.dateString != null)
        startController.text = widget.state!.dateString ?? '';
      if (widget.state?.endDate != null)
        endController.text = widget.state!.endDate!.toFormat(DATE_FORMAT);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Guest details', style: context.text.titleMedium),
        SizedBox(
          height: Spacing.extraSmall_h,
        ),
        TTextField(
          label: 'Enter guest name',
          controller: nameController,
          onChanged: (x) {
            widget.onNameChanged(x);
          },
        ),
        SizedBox(
          height: Spacing.small_h,
        ),
        TTextField(
          label: 'Purpose of visit (Optional)',
          controller: purposeController,
          onChanged: (x) {
            widget.onPurposeChanged(x);
          },
        ),
        SizedBox(
          height: Spacing.medium_h,
        ),
        Text('Start & end date', style: context.text.titleMedium),
        SizedBox(
          height: Spacing.extraSmall_h,
        ),
        TTextField(
            label: 'Enter start date',
            readOnly: true,
            prefixIcon: Assets.calendar.svg(fit: BoxFit.scaleDown),
            controller: startController,
            onTap: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)))
                  .then((dt) {
                if (dt != null) {
                  widget.onStartDateChanged(dt);
                }
              });
            },
            suffixIcon: Assets.chevronDown.svg(fit: BoxFit.scaleDown)),
        SizedBox(
          height: Spacing.small_h,
        ),
        TTextField(
            label: 'Enter end date',
            prefixIcon: Assets.calendar.svg(fit: BoxFit.scaleDown),
            errorText:
                widget.dateError ? 'End date must be in the future' : null,
            controller: endController,
            onTap: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)))
                  .then((dt) {
                if (dt != null) {
                  widget.onEndDateChanged(dt);
                }
              });
            },
            readOnly: true,
            suffixIcon: Assets.chevronDown.svg(fit: BoxFit.scaleDown))
      ],
    );
  }
}
