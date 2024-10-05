import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/icon_size.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/feature/visitor/invite_visitor/bloc/invite_visitor_screen_bloc.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../assets/assets.gen.dart';
import '../../../../ds/component/app_counter.dart';
import '../../../../ds/component/text_field.dart';

class SingleEntryScreen extends StatefulWidget {
  final InviteVisitorScreenState? state;
  final Function(String) onNameChanged;
  final Function(String) onPurposeChanged;
  final Function(DateTime) onStartDateChanged;
  final Function(TimeOfDay) onTimeChanged;
  final Function(int) onValidityChanged;
  final bool timeError;

  const SingleEntryScreen(
      {super.key,
      this.state,
      this.timeError = false,
      required this.onNameChanged,
      required this.onPurposeChanged,
      required this.onStartDateChanged,
      required this.onTimeChanged,
      required this.onValidityChanged});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<SingleEntryScreen> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  String? dateSupportText;

  @override
  Widget build(BuildContext context) {
    if (widget.state != null) {
      if (widget.state?.name != null) nameController.text = widget.state!.name!;
      if (widget.state?.purpose != null)
        purposeController.text = widget.state!.purpose!;
      if (widget.state?.dateString != null)
        dateController.text = widget.state?.dateTimeString ?? '';
      // if (widget.state?.startTime != null)
      //   timeController.text = widget.state!.startTime!.timeString;
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
          onChanged: (x) => widget.onNameChanged(x),
          inputType: TextInputType.name,
        ),
        SizedBox(
          height: Spacing.small_h,
        ),
        TTextField(
            label: 'Purpose of visit (Optional)',
            controller: purposeController,
            onChanged: (x) => widget.onPurposeChanged(x),
            inputType: TextInputType.name),
        SizedBox(
          height: Spacing.medium_h,
        ),
        Text('Date & time', style: context.text.titleMedium),
        SizedBox(
          height: Spacing.extraSmall_h,
        ),
        TTextField(
          label: 'Select invite date',
          controller: dateController,
          errorText: widget.timeError ? 'Time must be in the future' : null,
          readOnly: true,
          prefixIcon: Assets.calendar.svg(fit: BoxFit.scaleDown),
          onTap: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)))
                .then((dt) {
              if (dt != null) {
                widget.onStartDateChanged(dt);

                showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: Theme.of(context),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: MediaQuery(
                            data: MediaQuery.of(context).copyWith(
                              alwaysUse24HourFormat: false,
                            ),
                            child: child!,
                          ),
                        ),
                      );
                    }).then((t) {
                  if (t != null) {
                    widget.onTimeChanged(t);
                  }
                });
              }
            });
          },
          suffixIcon: Assets.chevronDown.svg(fit: BoxFit.scaleDown),
        ),
        SizedBox(
          height: Spacing.small_h,
        ),
        // TTextField(
        //     label: 'Select invite time',
        //     controller: timeController,
        //     prefixIcon: Assets.clock.svg(fit: BoxFit.scaleDown),
        //     errorText: widget.timeError ? 'Time must be in the future' : null,
        //     onTap: () {
        //
        //     },
        //     readOnly: true,
        //     suffixIcon: Assets.chevronDown.svg(fit: BoxFit.scaleDown)),
        SizedBox(
          height: Spacing.medium_h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Validity (In hours)', style: context.text.titleMedium),
            _validityBuilder(context, (x) => widget.onValidityChanged(x))
          ],
        )
      ],
    );
  }

  Widget _validityBuilder(BuildContext context, Function(int) onChanged) =>
      AppCounter(
        borderColor: context.color.surface,
        borderWidth: 0.5,
        borderRadius: 10,
        backgroundColor: context.color.surfaceContainer,
        textColor: context.color.secondary,
        textSize: 24,
        count: 1,
        step: 1,
        minCount: 1,
        maxCount: 10,
        incrementIcon: Icon(Icons.add,
            color: context.color.secondary, size: IconSize.medium.width),
        decrementIcon: Icon(
          Icons.remove,
          color: context.color.secondary,
          size: IconSize.medium.width,
        ),
        onCountChange: (x) {
          onChanged(x.round());
        },
        onIncrement: (count) {},
        onDecrement: (count) {},
      );
}
