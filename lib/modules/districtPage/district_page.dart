import 'package:bhulekh_uk/app_configs/app_assets.dart';
import 'package:bhulekh_uk/app_configs/app_colors.dart';
import 'package:bhulekh_uk/modules/districtPage/controller/district_controller.dart';
import 'package:bhulekh_uk/modules/districtPage/widgets/district_tile.dart';
import 'package:bhulekh_uk/widgets/adMob_service.dart';
import 'package:bhulekh_uk/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DistrictPage extends StatefulWidget {
  static const routeName = "/district";
  const DistrictPage({super.key});

  @override
  State<DistrictPage> createState() => _DistrictPageState();
}

class _DistrictPageState extends State<DistrictPage> {
  late DistrictController controller;
  BannerAd? _banner;
  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered<DistrictController>()
        ? Get.find<DistrictController>()
        : Get.put<DistrictController>(DistrictController(), permanent: true);
    _createBannerAd();
  }

  void _createBannerAd() {
    _banner = BannerAd(
        size: AdSize.banner,
        adUnitId: AdMobService.bannerAdUnitId!,
        listener: AdMobService.bannerAdListener,
        request: const AdRequest(nonPersonalizedAds: true))
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
        child: Column(children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF999900),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
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
                          "District",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "(जनपद चुने)",
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
            (state) => controller.obx(
              (state) => state == null
                  ? const Scaffold(
                      body: AppProgress(),
                    )
                  : Center(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return DistrictTile(state[index]);
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: state.length,
                      ),
                    ),
              onLoading: const Center(
                child: AppProgress(),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
