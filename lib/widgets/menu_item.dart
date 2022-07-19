import 'package:flutter/material.dart';

import '/theme/theme.dart';

class CourslyMenuItem extends StatelessWidget {
  final String text;
  final bool active;

  const CourslyMenuItem({
    required this.text,
    this.active = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.theme.extension<CourslyText>()!.menuItem(active).copyWith(
          color: active
              ? context.theme.extension<CourslyColor>()!.primaryColor
              : null),
    );
  }
}
