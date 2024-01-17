import 'package:bhulekh_uk/app_configs/app_colors.dart';
import 'package:bhulekh_uk/app_models/khasra_num.dart';
import 'package:bhulekh_uk/modules/report_page/controller/report_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KhasraNumberTile extends StatelessWidget {
  KhasraNumberTile(
    this.data, {
    Key? key,
  }) : super(key: key);
  final KhasraNumRes data;
  final controller = Get.put(ReportController());

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFEFF3BF),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          controller.fetchKhasraReport(data);
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${data.khasraNumber}",
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xff676F75),
                              fontWeight: FontWeight.bold),
                        ),
                        if (data.uniqueCode!.isNotEmpty)
                          Text(
                            "(${data.uniqueCode})",
                            style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xff676F75),
                                fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                    Text(
                      data.khataNumber ?? "",
                      style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xff676F75),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.primary.withOpacity(0.5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
