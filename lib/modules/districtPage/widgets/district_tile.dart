import 'package:bhulekh_uk/app_models/district.dart';
import 'package:bhulekh_uk/modules/tehsilPage/tehsil_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DistrictTile extends StatelessWidget {
  DistrictTile(this.districtData, {Key? key}) : super(key: key);
  final District districtData;

  // final controller = Get.put(TehsilController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(TehsilPage.routeName, arguments: {
          "districtData": districtData,
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${districtData.districtName} (${districtData.districtNameEnglish})",
                    style: const TextStyle(
                        color: Color(0xff676F75), fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  // TransactionTypeWidget(data.type),
                  // const SizedBox(height: 4),
                  // TransactionStatusWidget(data.status)
                ],
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

class TransactionStatusWidget extends StatelessWidget {
  final int status;

  const TransactionStatusWidget(this.status, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor, foregroundColor;
    String text;
    if (status == 1) {
      backgroundColor = Color(0xffE4FFD1);
      foregroundColor = Color(0xff448515);
      text = "COMPLETED";
    } else if (status == 2) {
      backgroundColor = Color(0xffE6F5FF);
      foregroundColor = Color(0xff0570BB);
      text = "PENDING";
    } else if (status == 3) {
      backgroundColor = Color(0xffFFE3E2);
      foregroundColor = Color(0xffD63F3C);
      text = "CANCELLED";
    } else {
      backgroundColor = Color(0xffFFE3E2);
      foregroundColor = Color(0xffD63F3C);
      text = "UNKNOWN";
    }

    return Material(
        shape: const StadiumBorder(),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Text(
            text,
            style: TextStyle(color: foregroundColor, fontSize: 12),
          ),
        ));
  }
}
