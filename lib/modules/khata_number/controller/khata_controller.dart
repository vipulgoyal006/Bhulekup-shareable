import 'dart:convert';
import 'dart:developer';
import 'package:bhulekh_uk/app_models/khataName.dart';
import 'package:bhulekh_uk/modules/khata_number/controller/fasil_controller.dart';
import 'package:bhulekh_uk/modules/khata_number/khata_number_page.dart';
import 'package:bhulekh_uk/modules/villagePage/controller/village_controller.dart';
import 'package:bhulekh_uk/widgets/app_buttons/app_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class KhataController extends GetxController with StateMixin<List<KhataName>> {
  int channelType = 1;
  late FasliController fasliController;
  String? name;
  String? kcn;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController acNumberTextController = TextEditingController();
  final GlobalKey<AppPrimaryButtonState> buttonKey =
      GlobalKey<AppPrimaryButtonState>();
  final GlobalKey<AppPrimaryButtonState> buttonKey2 =
      GlobalKey<AppPrimaryButtonState>();
  late VillageController villageController;

  @override
  void onInit() {
    super.onInit();
    fasliController = Get.isRegistered<FasliController>()
        ? Get.find<FasliController>()
        : Get.put(FasliController());
    villageController = Get.isRegistered<VillageController>()
        ? Get.find<VillageController>()
        : Get.put(VillageController());
    // getKhataNumberByName();
  }

  onNameSaved(String? value) {
    name = value?.trim();
  }

  onKcnSaved(String? value) {
    kcn = value?.trim();
  }

  Future<void> getKhataNumberByName() async {
    try {
      buttonKey2.currentState?.showLoader();

      final url = Uri.parse(
          "https://bhulekh.uk.gov.in/public/public_ror/action/public_action.jsp");
      final data = {
        "name": nameController.text,
        "act": "sbname",
        "vcc": fasliController.selectedVillage?.villageCodeCensus ?? "",
        "fasli-code-value":
            fasliController.selectedFasliYear.value?.fasliYear ?? "999",
        "fasli-name-value":
            fasliController.selectedFasliYear.value?.fasliYear ??
                "वर्तमान फसली",
      };
      final response = await http.post(
        url,
        body: data,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      if (response.statusCode == 200) {
        final responseData = await response.body.toString();
        final jsonData = json.decode(responseData);
        final khataName =
            List<KhataName>.from(jsonData.map((x) => KhataName.fromJson(x)));
        change(khataName,
            status:
                khataName.isNotEmpty ? RxStatus.success() : RxStatus.empty());
        if (khataName.isEmpty == true) {
          Get.dialog(SimpleDialog(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "No Data Found",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "(कोई डेटा मौजूद नहीं)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 60,
                    height: 40,
                    child: AppPrimaryButton(
                      color: Color(0xFF999900),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Ok"),
                    ),
                  )
                ],
              ),
            ],
          ));
        } else {
          Get.bottomSheet(
            const KhataNumberPage(),
            isScrollControlled: true,
            ignoreSafeArea: false,
          );
        }
      } else {}
    } catch (e, s) {
      log("Error", error: e, stackTrace: s);
      change(
        null,
        status: RxStatus.error(
          e.toString(),
        ),
      );
    } finally {
      buttonKey2.currentState?.hideLoader();
    }
  }

  String addLeadingZeros(String input, int desiredLength) {
    if (input.length >= desiredLength) {
      return input; // No need to add zeros, already long enough.
    } else {
      int zerosToAdd = desiredLength - input.length;
      return '0' * zerosToAdd + input;
    }
  }

  Future<void> enterKhataNumber() async {
    try {
      String result = addLeadingZeros(acNumberTextController.text, 5);
      buttonKey.currentState?.showLoader();
      final url = Uri.parse(
          "https://bhulekh.uk.gov.in/public/public_ror/action/public_action.jsp");
      final data = {
        "acn": result,
        "display_acn": acNumberTextController.text,
        "act": "sbacn",
        "vcc": fasliController.selectedVillage?.villageCodeCensus ?? "",
        "fasli-code-value":
            fasliController.selectedFasliYear.value?.fasliYear ?? "999",
        "fasli-name-value":
            fasliController.selectedFasliYear.value?.fasliYear ??
                "वर्तमान फसली",
      };
      final response = await http.post(
        url,
        body: data,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      if (response.statusCode == 200) {
        final responseData = await response.body.toString();
        final jsonData = json.decode(responseData);
        final khataName =
            List<KhataName>.from(jsonData.map((x) => KhataName.fromJson(x)));

        change(khataName,
            status:
                khataName.isNotEmpty ? RxStatus.success() : RxStatus.empty());
        if (khataName.isEmpty == true) {
          Get.dialog(SimpleDialog(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "No Data Found",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "(कोई डेटा मौजूद नहीं)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 60,
                    height: 40,
                    child: AppPrimaryButton(
                      color: Color(0xFF999900),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Ok"),
                    ),
                  )
                ],
              ),
            ],
          ));
        } else {
          Get.bottomSheet(
            const KhataNumberPage(),
            isScrollControlled: true,
            ignoreSafeArea: false,
          );
        }
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e, s) {
      log("Error", error: e, stackTrace: s);
      change(null, status: RxStatus.error(e.toString()));
    } finally {
      buttonKey.currentState?.hideLoader();
    }
  }
}
