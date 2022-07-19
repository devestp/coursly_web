import 'package:flutter/material.dart';

class CourslyText extends ThemeExtension<CourslyText> {
  const CourslyText();

  final baseTextStyle = const TextStyle(
    fontFamily: 'Poppins',
  );

  TextStyle get headerTitle => baseTextStyle.copyWith(
        fontSize: 64,
        fontWeight: FontWeight.w800,
      );

  TextStyle get headerDesc => baseTextStyle.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: const Color(0xff002333),
      );

  TextStyle get button => baseTextStyle.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );

  TextStyle menuItem(bool active) => baseTextStyle.copyWith(
        fontSize: 22,
        fontWeight: active? FontWeight.w700 : FontWeight.w400,
      );

  TextStyle get courseCardTitle => baseTextStyle.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      );

  TextStyle get courseCardType => baseTextStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: const Color(0xff8C8C8C),
      );

  TextStyle get courseCardMeta => baseTextStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  TextStyle get courseCardPro => baseTextStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w700,
      );

  @override
  ThemeExtension<CourslyText> copyWith() {
    // not implemented becuase we wont use this ability
    throw UnimplementedError();
  }

  @override
  ThemeExtension<CourslyText> lerp(
      ThemeExtension<CourslyText>? other, double t) {
    // not implemented becuase we wont use this ability
    throw UnimplementedError();
  }
}
