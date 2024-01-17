import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

mixin AppThemes {
  static final lightTheme = ThemeData(
    // fontFamily: Environment.fontFamily,
    canvasColor: AppColors.brightBackground,
    primarySwatch: AppColors.brightPrimary,
    primaryColor: AppColors.brightPrimary,
    dividerTheme:
        const DividerThemeData(thickness: 1.2, color: AppColors.divider),
    backgroundColor: AppColors.brightBackground,
    scaffoldBackgroundColor: const Color(0xffF5F5F5),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.brightPrimary,
        selectionHandleColor: AppColors.brightPrimary,
        selectionColor: AppColors.brightPrimary.withOpacity(0.3)),
    iconTheme: const IconThemeData(color: Colors.black),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.primary,
      titleTextStyle: TextStyle(
          fontSize: 18,
          // fontFamily: Environment.fontFamily,
          fontWeight: FontWeight.w700,
          color: AppColors.brightBackground),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(primary: AppColors.brightPrimary),
    ),
    // textTheme: TextTheme(
    //   bodyText1:
    //       TextStyle(color: Color(0xff2A2A2A), fontFamily: 'Rubik'),
    //   bodyText2:
    //       TextStyle(color: Color(0xff2A2A2A), fontFamily: 'Rubik'),
    // ),
  );
  static final darkTheme = ThemeData(
    // fontFamily: Environment.fontFamily,
    canvasColor: AppColors.darkBackground,
    scaffoldBackgroundColor: const Color(0xff414141),
    backgroundColor: AppColors.darkBackground,
    primarySwatch: AppColors.darkPrimary,
    primaryColor: AppColors.darkPrimary,
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.darkPrimary,
        selectionHandleColor: AppColors.darkPrimary,
        selectionColor: AppColors.brightPrimary.withOpacity(0.3)),
    iconTheme: const IconThemeData(color: Colors.white),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
          fontSize: 22,
          // fontFamily: Environment.fontFamily,
          fontWeight: FontWeight.w700,
          color: AppColors.brightPrimary),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(primary: AppColors.darkPrimary),
    ),

    // textTheme: TextTheme(
    //   bodyText1:
    //       TextStyle(color: Color(0xff2A2A2A), fontFamily: 'Rubik'),
    //   bodyText2:
    //       TextStyle(color: Color(0xff2A2A2A), fontFamily: 'Rubik'),
    // ),
  );
  static Color hexToColor(String hexString,
      {Color defaultColor = const Color(0xFF000000)}) {
    try {
      return Color(
          int.parse(hexString.substring(1, 7), radix: 16) + 0xFF000000);
    } catch (e) {
      return defaultColor;
    }
    // final buffer = StringBuffer();
    // if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    // buffer.write(hexString.replaceFirst('#', ''));
    // return Color(int.parse(buffer.toString(), radix: 16));
  }

  static ThemeData createThemeFromHexCode({
    required Brightness brightness,
    required String colorCode,
  }) {
    final Color primaryColor = hexToColor(colorCode);
    final MaterialColor primaryMaterialColor =
        MaterialColor(primaryColor.value, {
      50: primaryColor.withOpacity(.1),
      100: primaryColor.withOpacity(.2),
      200: primaryColor.withOpacity(.3),
      300: primaryColor.withOpacity(.4),
      400: primaryColor.withOpacity(.5),
      500: primaryColor.withOpacity(.6),
      600: primaryColor.withOpacity(.7),
      700: primaryColor.withOpacity(.8),
      800: primaryColor.withOpacity(.9),
      900: primaryColor.withOpacity(1),
    });
    final iconColor =
        brightness == Brightness.dark ? Colors.white : Colors.black;
    final Color backgroundColor = brightness == Brightness.dark
        ? AppColors.darkBackground
        : AppColors.brightBackground;
    final Color cardColor =
        brightness == Brightness.dark ? Colors.black : Colors.white;

    return ThemeData(
        // fontFamily: Environment.fontFamily,
        brightness: brightness,
        canvasColor: cardColor,
        cardColor: cardColor,
        primarySwatch: primaryMaterialColor,
        primaryColor: primaryMaterialColor,
        dividerColor: AppColors.divider,
        dividerTheme:
            const DividerThemeData(color: AppColors.divider, thickness: 1.2),
        backgroundColor: backgroundColor,
        cardTheme: CardTheme(
            color: cardColor,
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias),
        scaffoldBackgroundColor: backgroundColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryMaterialColor,
        ),
        textSelectionTheme: TextSelectionThemeData(
            cursorColor: primaryColor,
            selectionHandleColor: primaryColor,
            selectionColor: primaryColor.withOpacity(0.3)),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
              fontSize: 18,
              // fontFamily: Environment.fontFamily,
              fontWeight: FontWeight.w700,
              color: primaryMaterialColor),
          iconTheme: IconThemeData(color: iconColor),
        ),
        iconTheme: IconThemeData(color: iconColor),
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: brightness,
          primaryColor: primaryColor,
        ),
        dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))));
  }

  static String colorToHex(Color color, {bool leadingHashSign = false}) =>
      '${leadingHashSign ? '#' : ''}'
      // '${color.alpha.toRadixString(16).padLeft(2, '0')}'
      '${color.red.toRadixString(16).padLeft(2, '0')}'
      '${color.green.toRadixString(16).padLeft(2, '0')}'
      '${color.blue.toRadixString(16).padLeft(2, '0')}';
}
