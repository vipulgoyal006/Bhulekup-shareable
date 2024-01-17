import 'package:bhulekh_uk/app_configs/app_assets.dart';
import 'package:bhulekh_uk/modules/districtPage/district_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  static const routeName = "/";

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.offAllNamed(DistrictPage.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Image.asset(
                AppAssets.mainLogo,
                height: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
