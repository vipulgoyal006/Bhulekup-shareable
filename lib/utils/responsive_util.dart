import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppResponsiveUtil {
  static bool isSmallScreen() {
    return Get.size.width < 800;
  }

  static bool isLargeScreen() {
    return Get.size.width > 800;
  }

  static bool isMediumScreen() {
    return Get.size.width >= 800 && Get.size.width <= 1200;
  }
}
