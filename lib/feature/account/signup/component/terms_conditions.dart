import 'package:flutter/material.dart';

import '../../../../ds/component/spacing.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Spacing.extraExtraSmall),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: Row(
        children: [
          Checkbox(value: true, onChanged: (checked) {}),
          Flexible(
              child: Text.rich(TextSpan(
                  style: Theme.of(context).textTheme.bodySmall,
                  text: 'By signing up, I agree to Tenaid\'s ',
                  children: [
                TextSpan(
                    text: 'Privacy Policy',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.surfaceTint,
                        decoration: TextDecoration.underline)),
                const TextSpan(text: ' and '),
                TextSpan(
                    text: 'Terms & Conditions',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.surfaceTint,
                        decoration: TextDecoration.underline))
              ])))
        ],
      ),
    );
  }
}
