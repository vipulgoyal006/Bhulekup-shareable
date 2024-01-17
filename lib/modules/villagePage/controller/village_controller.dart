import 'dart:convert';
import 'dart:developer';

import 'package:bhulekh_uk/app_models/fasli_year.dart';
import 'package:bhulekh_uk/app_models/tehsil.dart';
import 'package:bhulekh_uk/app_models/village.dart';
import 'package:bhulekh_uk/modules/tehsilPage/controller/tehsil_controller.dart';
import 'package:bhulekh_uk/widgets/adMob_service.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;

class VillageController extends GetxController with StateMixin<List<Village>> {
  late List<FasliYear> fasliYear;
  late Tehsil selectedTehsil;
  late TehsilController tehsilController;
  InterstitialAd? _interstitialAd;

  @override
  void onInit() {
    super.onInit();
    tehsilController = Get.isRegistered<TehsilController>()
        ? Get.find<TehsilController>()
        : Get.put<TehsilController>(TehsilController(), permanent: true);
  }

  // void showInterstitialAd() {
  //   if (_interstitialAd != null) {
  //     _interstitialAd!.fullScreenContentCallback =
  //         FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
  //       ad.dispose();
  //       _createInterstitialAd();
  //     }, onAdFailedToShowFullScreenContent: (ad, error) {
  //       ad.dispose();
  //       _createInterstitialAd();
  //     });
  //     _interstitialAd!.show();
  //     _interstitialAd = null;
  //   }
  // }

  // void _createInterstitialAd() {
  //   InterstitialAd.load(
  //       adUnitId: AdMobService.interstitialUnitAdId!,
  //       request: const AdRequest(),
  //       adLoadCallback: InterstitialAdLoadCallback(
  //           onAdLoaded: (ad) => _interstitialAd = ad,
  //           onAdFailedToLoad: (LoadAdError error) => _interstitialAd = null));
  // }

  Future<void> getVillage() async {
    try {
      change(null, status: RxStatus.loading());
      final url = Uri.parse(
          "https://bhulekh.uk.gov.in/public/public_ror/action/public_action.jsp");
      final data = {
        "act": "fillVillage",
        "district_code": tehsilController.selectedDistrict.districtCodeCensus,
        "tehsil_code": selectedTehsil.tehsilCodeCensus,
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
            List<Village>.from(jsonData.map((x) => Village.fromJson(x)));
        change(users,
            status: users.isEmpty ? RxStatus.empty() : RxStatus.success());
      } else {
        throw "Server Unreachable";
      }
    } catch (e, s) {
      log("Error", error: e, stackTrace: s);
    }
  }
}
