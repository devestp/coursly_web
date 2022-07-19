import 'package:flutter/material.dart';

import 'color.dart';
import 'text.dart';

export 'color.dart';
export 'text.dart';

extension ContextTheme on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }
}

final theme = ThemeData(
  fontFamily: 'Poppins',
  extensions: const [
    CourslyColor(),
    CourslyText(),
  ],
);
