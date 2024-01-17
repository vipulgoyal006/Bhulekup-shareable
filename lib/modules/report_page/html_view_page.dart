import 'package:bhulekh_uk/app_configs/app_colors.dart';
import 'package:bhulekh_uk/modules/districtPage/district_page.dart';
import 'package:bhulekh_uk/modules/report_page/controller/report_controller.dart';
import 'package:bhulekh_uk/widgets/app_buttons/app_buttons/app_back_button.dart';
import 'package:bhulekh_uk/widgets/app_error_widget.dart';
import 'package:bhulekh_uk/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlViewPage extends StatefulWidget {
  static const routeName = '/HtmlViewPage';

  const HtmlViewPage({super.key});

  @override
  _HtmlViewPageState createState() => _HtmlViewPageState();
}

class _HtmlViewPageState extends State<HtmlViewPage> {
  late ReportController controller;
  late WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered<ReportController>()
        ? Get.find<ReportController>()
        : Get.put<ReportController>(ReportController(), permanent: true);
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadHtmlString(controller.htmlResponse.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () async {
          if (true) {
            controller.convert();
          }
        },
        child: const Icon(
          Icons.download_rounded,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: AppBackButton(
          color: Colors.white,
          onPressed: () {
            Get.offAllNamed(DistrictPage.routeName);
          },
        ),
        title: const Text(
          "Report",
          style: TextStyle(color: Colors.white),
        ),
        titleSpacing: 0,
      ),
      body: controller.htmlResponse.isEmpty
          ? const AppEmptyWidget()
          : WebViewWidget(
              controller: webViewController,
            ),
    );
  }
}
