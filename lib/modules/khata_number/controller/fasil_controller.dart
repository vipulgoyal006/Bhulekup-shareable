import 'dart:convert';
import 'dart:developer';
import 'package:bhulekh_uk/app_models/fasli_year.dart';
import 'package:bhulekh_uk/app_models/village.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FasliController extends GetxController with StateMixin<List<FasliYear>> {
  List<FasliYear>? fasilYearList;
  Village? selectedVillage;
  Rx<FasliYear?> selectedFasliYear = Rx(null);
  List<FasliYear> names = [FasliYear(fasliYear: "999")];

  @override
  void onInit() {
    super.onInit();

    getFasliYear().whenComplete(() {
      if (names.isNotEmpty) {
        selectedFasliYear.value = names[0];
      }
    });
  }

  Future<void> getFasliYear() async {
    try {
      change(null, status: RxStatus.loading());
      final url = Uri.parse(
          "https://bhulekh.uk.gov.in/public/public_ror/action/public_action.jsp");
      final data = {
        "act": "fillfasliyear",
        "village_code": selectedVillage?.villageCodeCensus ?? "",
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
        fasilYearList =
            List<FasliYear>.from(jsonData.map((x) => FasliYear.fromJson(x)));
        names.addAll(fasilYearList!);
        change(names, status: RxStatus.success());
      } else {
        throw "Server Unreachable";
      }
    } catch (e, s) {
      log("Error", error: e, stackTrace: s);
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
