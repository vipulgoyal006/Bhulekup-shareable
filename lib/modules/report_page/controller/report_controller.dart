import 'dart:io';

import 'package:bhulekh_uk/app_models/khasra_num.dart';
import 'package:bhulekh_uk/app_models/khataName.dart';
import 'package:bhulekh_uk/modules/khata_number/controller/fasil_controller.dart';
import 'package:bhulekh_uk/modules/report_page/html_view_page.dart';
import 'package:bhulekh_uk/modules/tehsilPage/controller/tehsil_controller.dart';
import 'package:bhulekh_uk/modules/villagePage/controller/village_controller.dart';
import 'package:bhulekh_uk/widgets/app_buttons/app_buttons/app_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ReportController extends GetxController {
  RxString htmlResponse = RxString('');
  late TehsilController tehsilController;
  late VillageController villageController;
  late FasliController fasliController;

  @override
  void onInit() {
    super.onInit();
    tehsilController = Get.isRegistered<TehsilController>()
        ? Get.find<TehsilController>()
        : Get.put<TehsilController>(TehsilController(), permanent: true);
    villageController = Get.isRegistered<VillageController>()
        ? Get.find<VillageController>()
        : Get.put<VillageController>(VillageController(), permanent: true);
    fasliController = Get.isRegistered<FasliController>()
        ? Get.find<FasliController>()
        : Get.put<FasliController>(FasliController(), permanent: true);
  }

  Future<void> fetchReport(KhataName khataName) async {
    final url = Uri.parse(
        'https://bhulekh.uk.gov.in/public/public_ror/public_ror_report.jsp');
    final formData = http.MultipartRequest('POST', url);

    formData.fields.addAll({
      'khata_number': khataName.khataNumber ?? "",
      'district_name': tehsilController.selectedDistrict.districtName,
      'district_code': tehsilController.selectedDistrict.districtCodeCensus,
      'tehsil_name': villageController.selectedTehsil.tehsilName,
      'tehsil_code': villageController.selectedTehsil.tehsilCodeCensus,
      'village_name': fasliController.selectedVillage?.vname ?? "",
      'village_code': fasliController.selectedVillage?.villageCodeCensus ?? '',
      'pargana_name': fasliController.selectedVillage?.pname ?? "",
      'pargana_code': fasliController.selectedVillage?.parganaCodeNew ?? "",
      'fasli_code': fasliController.selectedFasliYear.value?.fasliYear ?? "999",
      'fasli_name':
          fasliController.selectedFasliYear.value?.fasliYear ?? "वर्तमान फसली",
    });
    final response = await formData.send();
    if (response.statusCode == 200) {
      htmlResponse.value = await response.stream.bytesToString();
      Get.toNamed(HtmlViewPage.routeName);
    } else {
      htmlResponse.value = 'Failed to fetch data: ${response.statusCode}';
    }
  }

  Future<void> fetchKhasraReport(KhasraNumRes data) async {
    final url = Uri.parse(
        'https://bhulekh.uk.gov.in/public/public_ror/public_ror_report.jsp');
    final formData = http.MultipartRequest('POST', url);

    formData.fields.addAll({
      'khata_number': data.khataNumber ?? "",
      'district_name': tehsilController.selectedDistrict.districtName,
      'district_code': tehsilController.selectedDistrict.districtCodeCensus,
      'tehsil_name': villageController.selectedTehsil.tehsilName,
      'tehsil_code': villageController.selectedTehsil.tehsilCodeCensus,
      'village_name': fasliController.selectedVillage?.vname ?? "",
      'village_code': fasliController.selectedVillage?.villageCodeCensus ?? '',
      'pargana_name': fasliController.selectedVillage?.pname ?? "",
      'pargana_code': fasliController.selectedVillage?.parganaCodeNew ?? "",
      'fasli_code': fasliController.selectedFasliYear.value?.fasliYear ?? "999",
      'fasli_name':
          fasliController.selectedFasliYear.value?.fasliYear ?? "वर्तमान फसली",
    });
    final response = await formData.send();
    if (response.statusCode == 200) {
      htmlResponse.value = await response.stream.bytesToString();
      Get.toNamed(HtmlViewPage.routeName);
    } else {
      htmlResponse.value = 'Failed to fetch d ata: ${response.statusCode}';
    }
  }

  Future<String?> get _localPath async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationSupportDirectory();
      } else {
        // if platform is android
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err, stack) {
      print("Can-not get download folder path");
    }
    return directory?.path;
  }

  convert() async {
    var targetPath = await _localPath;
    var targetFileName =
        "Khata_report${DateTime.now().millisecondsSinceEpoch}.pdf";

    var generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlResponse.value, targetPath!, targetFileName);
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: Text(generatedPdfFile.toString()),
    ));
  }
}
