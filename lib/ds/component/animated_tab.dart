import 'package:flutter/material.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class AnimatedAppTab extends StatefulWidget {
  final List<String> items;
  final ValueSetter<int> onChanged;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  const AnimatedAppTab(
      {super.key,
      this.padding,
      required this.onChanged,
      required this.items,
      this.backgroundColor});

  @override
  State<AnimatedAppTab> createState() => _AnimatedAppTabState();
}

class _AnimatedAppTabState extends State<AnimatedAppTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final padding = widget.padding ??
        const EdgeInsets.symmetric(horizontal: 3, vertical: 2);
    return LayoutBuilder(builder: (context, constraint) {
      const offset = 0.02;
      final width = constraint.maxWidth;
      return Container(
        padding: padding,
        width: width,
        decoration: ShapeDecoration(
          color: context.color.surfaceContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        height: 56,
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedAlign(
              alignment: Alignment(
                  (selectedIndex /
                          (widget.items.length - 1) *
                          (2 - 2 * offset)) -
                      1 +
                      offset,
                  0),
              duration: const Duration(milliseconds: 200),
              child: Container(
                height: 48,
                width: (width / widget.items.length),
                decoration: BoxDecoration(
                  color: context.color.secondary,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                widget.items.length,
                (index) {
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        widget.onChanged(selectedIndex);
                      },
                      child: SizedBox(
                        width: width / widget.items.length,
                        child: Text(
                          widget.items[index],
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: context.text.titleMedium?.copyWith(
                            color: selectedIndex == index
                                ? context.color.surface
                                : context.color.secondary,
                            fontWeight: selectedIndex == index
                                ? FontWeight.w600
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
