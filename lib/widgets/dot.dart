import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import '/theme/theme.dart';

class Dot extends StatelessWidget {
  final bool active;
  
  const Dot({this.active = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 300,
      ),
      width: active ? 38 : 12,
      height: 12,
      decoration: BoxDecoration(
        color: active
            ? context.theme.extension<CourslyColor>()!.primaryColor
            : Colors.white,
        border: Border.all(),
        borderRadius: SmoothBorderRadius(cornerRadius: 40, cornerSmoothing: 1),
      ),
    );
  }
}
