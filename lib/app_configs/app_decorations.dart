import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

mixin AppDecorations {
  static const introLinearGradient = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Color(0xff312A87), Color(0xff213068)]);

  static InputDecoration textFieldDecoration(BuildContext context,
      {double radius = 8}) {
    return InputDecoration(
      filled: false,
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      contentPadding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey.shade300
              : AppColors.borderColor,
          width: 2.4,
        ),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey.shade300
              : AppColors.borderColor,
          width: 2.4,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2.4,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey.shade300
              : AppColors.borderColor,
          width: 2.4,
        ),
      ),
    );
  }

  static InputDecoration textFieldOutlinedDecoration(
      {double radius = 16, bool isFilled = false}) {
    return InputDecoration(
      filled: isFilled,
      fillColor: Get.theme.canvasColor,
      hintStyle: const TextStyle(
          color: AppColors.subtitleGrey,
          fontWeight: FontWeight.w500,
          fontSize: 16),
      contentPadding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: Get.theme.brightness == Brightness.dark
              ? Colors.grey.shade300
              : AppColors.borderColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: Get.theme.brightness == Brightness.dark
              ? Colors.grey.shade300
              : AppColors.borderColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: Color(0xFF999900), width: 1.5)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: Get.theme.brightness == Brightness.dark
              ? Colors.grey.shade300
              : AppColors.borderColor,
        ),
      ),
    );
  }

  static InputDecoration textFieldOutlinedDecoration5(
      {required String hintText, double radius = 16, bool isFilled = false}) {
    return InputDecoration(
        hintText: hintText,
        filled: isFilled,
        fillColor: Get.theme.canvasColor,
        hintStyle: const TextStyle(
            color: AppColors.subtitleGrey,
            fontWeight: FontWeight.w500,
            fontSize: 16),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: AppColors.borderColor,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: Get.theme.brightness == Brightness.dark
                  ? Colors.grey.shade300
                  : AppColors.borderColor,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: Get.theme.primaryColor, width: 1.5)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: Get.theme.brightness == Brightness.dark
                  ? Colors.grey.shade300
                  : AppColors.borderColor,
            )));
  }

  static InputDecoration textFieldOutlinedDecoration4(
      {double radius = 16, bool isFilled = false}) {
    return InputDecoration(
        filled: isFilled,
        fillColor: Get.theme.canvasColor,
        hintStyle: const TextStyle(
            color: AppColors.subtitleGrey,
            fontWeight: FontWeight.w500,
            fontSize: 16),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: AppColors.borderColor,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: Get.theme.brightness == Brightness.dark
                  ? Colors.grey.shade300
                  : AppColors.borderColor,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: Get.theme.primaryColor, width: 1.5)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: Get.theme.brightness == Brightness.dark
                  ? Colors.grey.shade300
                  : AppColors.borderColor,
            )));
  }

  static InputDecoration textFieldDecoration1(
      {required String hintText, double radius = 8}) {
    return InputDecoration(
      hintText: hintText,
      prefixIcon: const Icon(
        Icons.search,
        color: Colors.black,
      ),
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(color: Color(0xFF828282), fontSize: 14),
      contentPadding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          gapPadding: 0,
          borderSide: const BorderSide(color: Colors.transparent)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          gapPadding: 0,
          borderSide: const BorderSide(color: Colors.transparent)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          gapPadding: 0,
          borderSide: const BorderSide(color: Colors.transparent)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          gapPadding: 0,
          borderSide: const BorderSide(color: Colors.transparent)),
    );
  }

  static InputDecoration textFieldDecoration4(
      {required String hintText, double radius = 8}) {
    return InputDecoration(
      hintText: hintText,
      prefixIcon: const Icon(
        Icons.search,
        color: Colors.black,
      ),
      filled: true,
      fillColor: const Color(0xFFF2EEF4),
      hintStyle: const TextStyle(color: Color(0xFF828282), fontSize: 14),
      contentPadding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          gapPadding: 0,
          borderSide: const BorderSide(color: Colors.transparent)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          gapPadding: 0,
          borderSide: const BorderSide(color: Colors.transparent)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          gapPadding: 0,
          borderSide: const BorderSide(color: Colors.transparent)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          gapPadding: 0,
          borderSide: const BorderSide(color: Colors.transparent)),
    );
  }

  static InputDecoration textFieldDecoration2({double radius = 8}) {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.brightBackground,
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      contentPadding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          gapPadding: 0,
          borderSide: const BorderSide(color: Colors.transparent)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          gapPadding: 0,
          borderSide: const BorderSide(color: Colors.transparent)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          gapPadding: 0,
          borderSide: const BorderSide(color: Colors.transparent)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          gapPadding: 0,
          borderSide: const BorderSide(color: Colors.transparent)),
    );
  }

  static InputDecoration textFieldDecoration3({double radius = 8}) {
    return const InputDecoration(
      filled: true,
      fillColor: AppColors.brightBackground,
      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
      contentPadding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
          borderSide: BorderSide(color: Colors.transparent)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
          borderSide: BorderSide(color: Colors.transparent)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
          borderSide: BorderSide(color: Colors.transparent)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
          borderSide: BorderSide(color: Colors.transparent)),
    );
  }
}

/// Uppercase text formatter
class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(oldValue, TextEditingValue newValue) =>
      TextEditingValue(
          text: newValue.text.toLowerCase(), selection: newValue.selection);
}

class ChannelNameFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String filteredText =
        newValue.text.toLowerCase(); //.replaceAll(RegExp(r'[^\w\s]+'), '');

    filteredText = filteredText.replaceAll(RegExp(r'\s+'), '-')
      ..replaceAll(RegExp(r'-+'), '-');

    return TextEditingValue(
        text: filteredText,
        selection: TextSelection.fromPosition(
            TextPosition(offset: filteredText.length)),
        composing: TextRange(start: 0, end: filteredText.length));
  }
}
