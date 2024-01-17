import 'dart:convert';
import 'dart:developer';
import 'package:bhulekh_uk/app_models/district.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DistrictController extends GetxController
    with StateMixin<List<District>> {
  late ScrollController scrollController;
  OverlayEntry? overlayEntry;

  get districts => null;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController()..addListener(_scrollListener);
    makeApiCall();
  }

  Future<void> makeApiCall() async {
    try {
      change(null, status: RxStatus.loading());
      final url = Uri.parse(
          "https://bhulekh.uk.gov.in/public/public_ror/action/public_action.jsp");
      final data = {
        "act": "fillDistrict",
      };
      final response = await http.post(
        url,
        body: data,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      if (response.statusCode == 200) {
        final responseData = response.body.toString();
        final jsonData = json.decode(responseData);
        final users =
            List<District>.from(jsonData.map((x) => District.fromJson(x)));
        change(users,
            status: users.isEmpty ? RxStatus.empty() : RxStatus.success());
      } else {
        throw "Server Unreachable";
      }
    } catch (e, s) {
      log("error", error: e, stackTrace: s);
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  _scrollListener() {
    overlayEntry?.remove();
    overlayEntry = null;
  }
}
