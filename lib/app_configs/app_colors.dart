import 'package:flutter/material.dart';

mixin AppColors {
  static const brightBackground = Color(0xfff8f5f9);
  static const primary = Color(0xFF999900);
  static const darkBackground = Color(0xff000000);
  static const borderColor = Color(0xffBDBDBD);
  static const divider = Color(0xffC4C3C3);
  static const darkGrey = Color(0xff676F75);
  static const subtitleGrey = Color(0xff828282);
  static const lightGrey = Color(0xffA4A4A4);
  static const descriptionText = Color(0xff575757);
  static const textColor = Color(0xff252525);
  static const appBarTextColor = Color(0xff130F26);
  static const gray = Color(0xffE2E2E2);
  static const ownChat = Color(0xFFE9E6EE);

  static const MaterialColor brightPrimary =
      MaterialColor(brightPrimaryValue, <int, Color>{
    50: Color(0xFFF8FAE5),
    100: Color(0xFFEFF3BF),
    200: Color(0xFFE3EC94),
    300: Color(0xFFD8E469),
    400: Color(0xFFCFDD47),
    500: Color(brightPrimaryValue),
    600: Color(0xFFBAC616),
    700: Color(0xFFAAB00A),
    800: Color(0xFF999900),
    900: Color(0xFF7E7300),
  });
  static const int brightPrimaryValue = 0xFFC7D81C;

  static const MaterialColor darkPrimary =
      MaterialColor(darkPrimaryPrimaryValue, <int, Color>{
    50: Color(0xFFF8FAE5),
    100: Color(0xFFEFF3BF),
    200: Color(0xFFE3EC94),
    300: Color(0xFFD8E469),
    400: Color(0xFFCFDD47),
    500: Color(brightPrimaryValue),
    600: Color(0xFFBAC616),
    700: Color(0xFFAAB00A),
    800: Color(0xFF999900),
    900: Color(0xFF7E7300),
  });
  static const int darkPrimaryPrimaryValue = 0xFF442D75;

  static const List<Color> randomColors = [
    Color(0xffEE6F57),
    Color(0xffFFC444),
    Color(0xff48A7FF),
    Color(0xffA2C345),
    Color(0xff0BE2B0),
    Color(0xffF44611),
    Color(0xff474A51),
  ];
}
