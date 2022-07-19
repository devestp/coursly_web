import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';

import '/theme/theme.dart';

class CourslyButton extends StatelessWidget {
  final String text;
  final Color? bgColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  const CourslyButton({
    required this.text,
    this.onTap,
    this.bgColor,
    Key? key,
    this.textStyle,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 56,
          vertical: 18,
        ),
        decoration: BoxDecoration(
          borderRadius: const SmoothBorderRadius.all(
            SmoothRadius(
              cornerRadius: 8,
              cornerSmoothing: 1,
            ),
          ),
          color: bgColor ??
              context.theme.extension<CourslyColor>()!.defaultBtnColor,
        ),
        child: Text(
          text,
          style: textStyle ??
              context.theme
                  .extension<CourslyText>()!
                  .button
                  .copyWith(color: textColor),
        ),
      ),
    );
  }
}
