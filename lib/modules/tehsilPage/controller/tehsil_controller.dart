import 'dart:convert';
import 'dart:developer';

import 'package:bhulekh_uk/app_models/district.dart';
import 'package:bhulekh_uk/app_models/tehsil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TehsilController extends GetxController with StateMixin<List<Tehsil>> {
  late District selectedDistrict;

  Future<void> getTehsil() async {
    try {
      change(null, status: RxStatus.loading());
      final url = Uri.parse(
          "https://bhulekh.uk.gov.in/public/public_ror/action/public_action.jsp");
      final data = {
        "act": "fillTehsil",
        "district_code": selectedDistrict.districtCodeCensus,
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
            List<Tehsil>.from(jsonData.map((x) => Tehsil.fromJson(x)));
        change(users,
            status: users.isEmpty ? RxStatus.empty() : RxStatus.success());
      } else {
        print("API Error: ${response.statusCode}");
      }
    } catch (e, s) {
      log("error", error: e, stackTrace: s);
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
