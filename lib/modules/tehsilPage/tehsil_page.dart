import 'package:bhulekh_uk/app_configs/app_assets.dart';
import 'package:bhulekh_uk/app_models/district.dart';
import 'package:bhulekh_uk/modules/tehsilPage/controller/tehsil_controller.dart';
import 'package:bhulekh_uk/modules/tehsilPage/widgets/tehsil_tile.dart';
import 'package:bhulekh_uk/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class TehsilPage extends StatefulWidget {
  static const routeName = "/tehsilPage";
  const TehsilPage({super.key});

  @override
  State<TehsilPage> createState() => _TehsilPageState();
}

class _TehsilPageState extends State<TehsilPage> {
  BannerAd? _banner;
  late TehsilController controller;
  late District districtData;

  @override
  void initState() {
    super.initState();
    final map = Get.arguments as Map<String, dynamic>?;
    if (map != null) {
      districtData = map['districtData'];
    }
    controller = Get.isRegistered<TehsilController>()
        ? Get.find<TehsilController>()
        : Get.put<TehsilController>(TehsilController(), permanent: true);
    controller.selectedDistrict = districtData;
    controller.getTehsil();
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
                      Text(districtData.districtName,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))
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
                            "Tehsil",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "(तहसील चुने)",
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
            Center(
              child: controller.obx(
                (state) => state == null
                    ? const Scaffold(
                        body: Center(
                          child: AppProgress(),
                        ),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => TehsilTile(
                              state[index],
                              districtData: districtData,
                            ),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: state.length),
                onLoading: const Center(
                  child: AppProgress(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
