import 'package:bhulekh_uk/app_configs/app_assets.dart';
import 'package:bhulekh_uk/app_configs/app_colors.dart';
import 'package:bhulekh_uk/app_models/district.dart';
import 'package:bhulekh_uk/app_models/tehsil.dart';
import 'package:bhulekh_uk/modules/khata_number/controller/fasil_controller.dart';
import 'package:bhulekh_uk/modules/villagePage/controller/village_controller.dart';
import 'package:bhulekh_uk/modules/villagePage/widget/village_tile.dart';
import 'package:bhulekh_uk/widgets/adMob_service.dart';
import 'package:bhulekh_uk/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class VillagePage extends StatefulWidget {
  static const routeName = "/villagePage";

  const VillagePage({super.key});

  @override
  State<VillagePage> createState() => _VillagePageState();
}

class _VillagePageState extends State<VillagePage> {
  late VillageController controller;
  late District districtData;
  late Tehsil tehsilData;
  late FasliController fasliController;
  BannerAd? _banner;

  @override
  void initState() {
    super.initState();
    final map = Get.arguments as Map<String, dynamic>?;
    if (map != null) {
      districtData = map['district'];
      tehsilData = map['tehsil'];
    }
    controller = Get.isRegistered<VillageController>()
        ? Get.find<VillageController>()
        : Get.put<VillageController>(VillageController(), permanent: true);
    fasliController = Get.isRegistered<FasliController>()
        ? Get.find<FasliController>()
        : Get.put(FasliController());
    controller.selectedTehsil = tehsilData;
    controller.getVillage();
    _createBannerAd();
  }

  void _createBannerAd() {
    _banner = BannerAd(
        size: AdSize.banner,
        adUnitId: AdMobService.bannerAdUnitId!,
        listener: AdMobService.bannerAdListener,
        request: const AdRequest(nonPersonalizedAds: false))
      ..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _banner == null
          ? const SizedBox()
          : Container(
              height: 52,
              margin: const EdgeInsets.only(bottom: 12),
              child: AdWidget(
                ad: _banner!,
              ),
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFF999900),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "${districtData.districtName} - ${tehsilData.tehsilName}",
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select your",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          Text(
                            "Village",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "(ग्राम का नाम)",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                      SvgPicture.asset(AppAssets.pointer),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            controller.obx(
              (state) => state == null
                  ? const Center(
                      child: AppProgress(),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => VillageTile(
                            state[index],
                            districtData: districtData,
                            tehsilData: tehsilData,
                            index: index,
                          ),
                      separatorBuilder: (context, index) =>
                          Divider(color: AppColors.divider.withOpacity(0.3)),
                      itemCount: state.length),
              onLoading: const Center(
                child: AppProgress(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
