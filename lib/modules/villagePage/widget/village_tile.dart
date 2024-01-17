import 'package:bhulekh_uk/app_models/district.dart';
import 'package:bhulekh_uk/app_models/tehsil.dart';
import 'package:bhulekh_uk/app_models/village.dart';
import 'package:bhulekh_uk/modules/khata_number/search_khata_number.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VillageTile extends StatelessWidget {
  VillageTile(
    this.data, {
    Key? key,
    required this.districtData,
    required this.tehsilData,
    required this.index,
  }) : super(key: key);
  final Village data;
  final int index;
  final District districtData;
  final Tehsil tehsilData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(SearchKhataNumber.routeName, arguments: {
          "villageData": data,
          "districtData": districtData,
          "tehsilData": tehsilData
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
        child: Row(
          children: [
            Text(
              "(${index + 1})",
              style: const TextStyle(
                  color: Color(0xff676F75), fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: SizedBox(
                child: Text(
                  "${data.vname} (${data.vnameEng})",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: const TextStyle(
                      color: Color(0xff676F75),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
