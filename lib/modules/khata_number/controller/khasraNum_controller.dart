import 'dart:convert';
import 'dart:developer';
import 'package:bhulekh_uk/app_models/khasra_num.dart';
import 'package:bhulekh_uk/modules/khata_number/controller/fasil_controller.dart';
import 'package:bhulekh_uk/modules/khata_number/khasra_numebr.dart';
import 'package:bhulekh_uk/modules/tehsilPage/controller/tehsil_controller.dart';
import 'package:bhulekh_uk/modules/villagePage/controller/village_controller.dart';
import 'package:bhulekh_uk/widgets/app_buttons/app_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class KhasraNumController extends GetxController
    with StateMixin<List<KhasraNumRes>> {
  RxString htmlResponse = RxString('');

  final TextEditingController kcnTextController = TextEditingController();
  late FasliController fasliController;
  late TehsilController tehsilController;
  late VillageController villageController;
  final GlobalKey<AppPrimaryButtonState> buttonKey = GlobalKey();

  @override
  void dispose() {
    fasliController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    fasliController = Get.isRegistered<FasliController>()
        ? Get.find<FasliController>()
        : Get.put(FasliController());
    tehsilController = Get.isRegistered<TehsilController>()
        ? Get.find<TehsilController>()
        : Get.put<TehsilController>(TehsilController(), permanent: true);
    villageController = Get.isRegistered<VillageController>()
        ? Get.find<VillageController>()
        : Get.put<VillageController>(VillageController(), permanent: true);
  }

  Future<void> getKhataNumberByKsrNbr() async {
    try {
      buttonKey.currentState?.showLoader();
      final url = Uri.parse(
          "https://bhulekh.uk.gov.in/public/public_ror/action/public_action.jsp");
      final data = {
        "kcn": kcnTextController.text,
        "act": "sbksn",
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
        final responseData = response.body.toString();
        final jsonData = json.decode(responseData);
        final khasraRes = List<KhasraNumRes>.from(
            jsonData.map((x) => KhasraNumRes.fromJson(x)));
        change(khasraRes,
            status:
                khasraRes.isNotEmpty ? RxStatus.success() : RxStatus.empty());
        if (khasraRes.isEmpty == true) {
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
                      color: const Color(0xFF999900),
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
          Get.toNamed(KhasraNumberPage.routeName);
          // Get.dialog(
          //   const Dialog(
          //     clipBehavior: Clip.antiAlias,
          //     child: SizedBox(height: 150, child: KhasraNumberPage()),
          //   ),
          // );
        }
      } else {
        throw "Server Unreachable";
      }
    } catch (e, s) {
      log("Error", error: e, stackTrace: s);
      change(null, status: RxStatus.error(e.toString()));
    } finally {
      buttonKey.currentState?.hideLoader();
    }
  }
}
