import 'package:flutter/material.dart';

class CourslyColor extends ThemeExtension<CourslyColor>{
  final Color bgColor = const Color(0xffffffff);
  final Color defaultBtnColor = const Color.fromARGB(13, 0, 0, 0);
  final Color primaryColor = const Color(0xff6664FF);


  const CourslyColor();

  @override
  ThemeExtension<CourslyColor> copyWith() {
    // not implemented becuase we wont use this ability
    throw UnimplementedError();
  }

  @override
  ThemeExtension<CourslyColor> lerp(ThemeExtension<CourslyColor>? other, double t) {
    // not implemented becuase we wont use this ability
    throw UnimplementedError();
  }
  
}