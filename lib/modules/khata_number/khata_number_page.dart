import 'package:bhulekh_uk/app_configs/app_colors.dart';
import 'package:bhulekh_uk/modules/khata_number/controller/khata_controller.dart';
import 'package:bhulekh_uk/modules/khata_number/widget/khata_number_tile.dart';
import 'package:bhulekh_uk/widgets/app_error_widget.dart';
import 'package:bhulekh_uk/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KhataNumberPage extends StatefulWidget {
  static const routeName = "/khataNumberPage";

  const KhataNumberPage({super.key});

  @override
  State<KhataNumberPage> createState() => _KhataNumberPageState();
}

class _KhataNumberPageState extends State<KhataNumberPage> {
  late KhataController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered<KhataController>()
        ? Get.find<KhataController>()
        : Get.put<KhataController>(KhataController(), permanent: true);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: .6,
      minChildSize: 0.4,
      maxChildSize: 1.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return SafeArea(
          child: Material(
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                          child: Text(
                        "Select Name",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )),
                      CloseButton(
                        onPressed: () {
                          Get.back();
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: controller.obx(
                    (state) => state == null
                        ? const Center(
                            child: AppErrorWidget(),
                          )
                        : ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {},
                                  child: KhataNumberTile(
                                    state[index],
                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 2,
                                ),
                            itemCount: state.length),
                    onLoading: const Center(
                      child: AppProgress(),
                    ),
                    onEmpty: const AppEmptyWidget(
                      textColor: Colors.black,
                    ),
                    onError: (e) => AppErrorWidget(
                      title: e.toString(),
                      onRetry: () {
                        controller.getKhataNumberByName();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
