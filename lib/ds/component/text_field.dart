import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../utils/debounce.dart';

@immutable
class TTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String s)? onChanged;
  final Function()? onTap;
  final Duration? debounce;
  final Function(bool hasFocus)? onFocusChanged;
  final Function()? onPrefixIconClicked;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final bool enable;
  final String? initialValue;
  final bool isSecret;
  final bool showSuffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final String? errorText;
  final String? supportText;
  final bool autoFocus;
  final bool readOnly;
  final int? lines;
  final TextInputType inputType;

  late TextEditingController _controller;

  TTextField(
      {super.key,
      this.lines,
      this.initialValue,
      this.isSecret = false,
      this.autoFocus = false,
      this.errorText,
      this.prefixIcon,
      this.supportText,
      this.textCapitalization = TextCapitalization.none,
      required this.label,
      this.showSuffix = true,
      this.inputType = TextInputType.text,
      this.enable = true,
      this.inputFormatters,
      this.onChanged,
      this.controller,
      this.readOnly = false,
      this.onPrefixIconClicked,
      this.onFocusChanged,
      this.onTap,
      this.debounce,
      this.suffixIcon});

  @override
  State<StatefulWidget> createState() {
    _controller = controller ?? TextEditingController();
    _controller.text = initialValue ?? '';
    return _State();
  }
}

class _State extends State<TTextField> {
  bool showClear = false;
  bool showSecret = false;
  FocusNode focusNode = FocusNode();
  Debounce? debounce;

  TextEditingController get controller => widget._controller;

  @override
  void didUpdateWidget(covariant TTextField oldWidget) {
    widget._controller = oldWidget._controller;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    if (debounce != null) {
      debounce!.dispose();
    }
    super.dispose();
  }

  void _showClear(bool show) {
    setState(() {
      showClear = show;
    });
  }

  @override
  void initState() {
    if (widget.autoFocus) {
      focusNode.requestFocus();
    }

    focusNode.addListener(() {
      if (widget.onFocusChanged != null) {
        widget.onFocusChanged!(focusNode.hasFocus);
      }

      if (focusNode.hasFocus && controller.text.isNotEmpty) {
        if (mounted) {
          _showClear(true);
        }
      }
    });

    // set debounce delay
    if (widget.debounce != null) debounce = Debounce(delay: widget.debounce!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => _child(context);

  _child(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            maxLines: widget.isSecret ? 1 : widget.lines,
            onTap: () {
              if (widget.readOnly) focusNode.unfocus();
              if (widget.onTap != null) widget.onTap!();
            },
            textCapitalization: widget.textCapitalization,
            focusNode: focusNode,
            readOnly: widget.readOnly,
            keyboardType: widget.inputType,
            controller: controller,
            enabled: widget.enable,
            obscureText: widget.isSecret && !showSecret,
            style: context.text.labelLarge,
            inputFormatters: widget.inputFormatters,
            onChanged: (x) {
              if (mounted) {
                _showClear(x.isNotEmpty);
              }
              if (widget.onChanged != null) {
                if (debounce != null) {
                  debounce!(() {
                    widget.onChanged!(x);
                  });
                } else {
                  widget.onChanged!(x);
                }
              }
            },
            decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.surface,
                filled: true,
                prefixIcon: widget.prefixIcon != null
                    ? GestureDetector(
                        onTap: widget.onPrefixIconClicked,
                        child: IntrinsicWidth(child: widget.prefixIcon),
                      )
                    : null,
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: context.color.surfaceBright),
                    borderRadius: BorderRadius.circular(5)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: context.color.primary),
                    borderRadius: BorderRadius.circular(5)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.5, color: _getEnabledBorderColor(context)),
                    borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: _getFocusBorderColor(context)),
                    borderRadius: BorderRadius.circular(5)),
                label: Text(
                  widget.label,
                  style: context.text.bodyMedium?.copyWith(
                      color: context.color.onSurface.withOpacity(0.5)),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.5,
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest)),
                suffixIcon: widget.suffixIcon != null
                    ? widget.suffixIcon!
                    : Visibility(
                        visible: showClear && widget.showSuffix,
                        child: GestureDetector(
                          onTap: () {
                            if (!widget.isSecret) {
                              focusNode.requestFocus();
                              controller.clear();
                              _showClear(false);
                              if (widget.onChanged != null) {
                                widget.onChanged!("");
                              }
                            } else {
                              if (mounted) {
                                setState(() {
                                  showSecret = !showSecret;
                                });
                              }
                            }
                          },
                          child: Icon(
                            widget.isSecret
                                ? (!showSecret
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined)
                                : Icons.clear,
                            color: Colors.black45,
                          ),
                        ),
                      )),
          ),
          if (_getSupportText()?.isNotEmpty == true)
            Column(
              children: [
                SizedBox(height: Spacing.extraExtraSmall_h),
                Text(
                  _getSupportText()!,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: _getSupportTextColor(context)),
                )
              ],
            )
        ],
      );

  _getSupportText() => widget.errorText?.isNotEmpty == true
      ? widget.errorText
      : widget.supportText;

  _getSupportTextColor(BuildContext context) =>
      widget.errorText?.isNotEmpty == true
          ? context.color.error
          : context.color.onSurface.withOpacity(0.70);

  _getEnabledBorderColor(BuildContext context) =>
      widget.errorText?.isNotEmpty == true
          ? context.color.error
          : context.color.surfaceContainerHighest;

  _getFocusBorderColor(BuildContext context) =>
      widget.errorText?.isNotEmpty == true
          ? context.color.error
          : context.color.onSurface;
}
