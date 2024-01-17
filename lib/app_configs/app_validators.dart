import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin AppFormValidators {
  static String? validateEmpty(dynamic data) {
    if (data == null) return "*required";
    if (data is String) {
      if (data.toString().trim().isEmpty) return "*required";
    }
    if (data is Iterable || data is Map) {
      if (data.isEmpty) return "*required";
    }
  }

  static String? validateLink(String? data, BuildContext context) {
    if (data == null) return "*required";

    if (data.toString().trim().isEmpty) return "*required";

    if (!GetUtils.isURL(data.trim())) {
      return "Invalid link";
    }
    return null;
  }

  static String? validateAmount(String? data, BuildContext context) {
    if (data == null) return "*required";
    if (data.isNotEmpty) {
      try {
        double amount = double.parse(data);
        if (amount <= 0) {
          return "Invalid amount";
        } else {
          return null;
        }
      } catch (e) {
        return "Invalid amount";
      }
    } else {
      return "*required";
    }
  }

  static String? validateNumber(String? data) {
    if (data == null) return "*required";
    if (data.isNotEmpty) {
      try {
        double.parse(data);
        return null;
      } catch (e) {
        return "Invalid number";
      }
    } else {
      return "*required";
    }
  }

  static String? validateMail(String? email) {
    if (email == null) return "*required";
    if (email.isEmpty) {
      return "*required";
    } else if (!GetUtils.isEmail(email)) {
      return "Invalid email id.";
    }
  }

  static String? validatePhone(String? phone, BuildContext context) {
    if (phone == null) return "*required";
    if (phone.trim().isEmpty) {
      return "*required";
    } else if (phone.trim().length != 10) {
      return "Invalid phone no.";
    } else if (!GetUtils.isPhoneNumber(phone)) {
      return "Invalid phone no.";
    }
  }

  static String? pinCodeValidator(String? value, {BuildContext? context}) {
    if (value == null || value.trim().isEmpty) {
      return '*required';
    } else {
      if (!RegExp(r'(^(?:[+0]9)?[0-9]{6,8}$)').hasMatch(value)) {
        return 'Not a valid pincode.';
      } else {
        return null;
      }
    }
  }

  static String? validateDob(DateTime? data,
      [int age = 0, BuildContext? context]) {
    if (data == null) return "*required";
    final now = DateTime.now();
    if (now.difference(data).inDays <= 13 * 365)
      return "You must be 13 years old.";
    return null;
  }
}
