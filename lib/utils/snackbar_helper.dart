import 'package:bhulekh_uk/utils/responsive_util.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class SnackBarHelper {
  static Future<void> show(String message, {isLong = false}) async {
    Fluttertoast.showToast(
        msg: message,
        toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        webBgColor: "#000000",
        fontSize: 16.0);
  }

  static Future<dynamic> showDialog(Widget widget,
      {dynamic arguments,
      bool? isScrollControlled,
      Color? backgroundColor,
      bool? ignoreSafeArea,
      RoundedRectangleBorder? shape}) async {
    if (AppResponsiveUtil.isSmallScreen()) {
      return Get.bottomSheet(widget,
          backgroundColor: backgroundColor,
          shape: shape,
          clipBehavior: Clip.antiAlias,
          isScrollControlled: isScrollControlled ?? true,
          ignoreSafeArea: ignoreSafeArea);
    } else {
      return Get.dialog(
        Dialog(
          shape: shape,
          clipBehavior: Clip.antiAlias,
          child: SizedBox(width: 500, child: widget),
        ),
        arguments: arguments,
        barrierDismissible: true,
      );
    }
  }

  static void vibrateDevice({int type = 1}) async {
    if (!kIsWeb) {
      if (type == 1) {
        HapticFeedback.lightImpact();
      } else if (type == 2) {
        HapticFeedback.mediumImpact();
      } else if (type == 3) {
        HapticFeedback.heavyImpact();
      } else {
        HapticFeedback.vibrate();
      }
    }
  }
}
