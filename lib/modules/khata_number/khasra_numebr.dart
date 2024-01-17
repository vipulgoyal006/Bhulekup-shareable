import 'package:bhulekh_uk/app_configs/app_colors.dart';
import 'package:bhulekh_uk/modules/khata_number/controller/khasraNum_controller.dart';
import 'package:bhulekh_uk/modules/khata_number/widget/khasra_num_tile.dart';
import 'package:bhulekh_uk/widgets/app_buttons/app_buttons/app_back_button.dart';
import 'package:bhulekh_uk/widgets/app_error_widget.dart';
import 'package:bhulekh_uk/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KhasraNumberPage extends StatefulWidget {
  static const routeName = '/khasraNumber';
  const KhasraNumberPage({super.key});

  @override
  State<KhasraNumberPage> createState() => _KhasraNumberPageState();
}

class _KhasraNumberPageState extends State<KhasraNumberPage> {
  late KhasraNumController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered<KhasraNumController>()
        ? Get.find<KhasraNumController>()
        : Get.put<KhasraNumController>(KhasraNumController(), permanent: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: AppBackButton(
          color: Colors.white,
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Khata Number",
          style: TextStyle(color: Colors.white),
        ),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: controller.obx(
          (state) => state == null && state!.isEmpty == true
              ? const Center(
                  child: Text("No Data Found"),
                )
              : ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      KhasraNumberTile(state[index]),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 2,
                      ),
                  itemCount: state.length),
          onLoading: const Center(
            child: AppProgress(),
          ),
          onEmpty: const Center(
            child: AppEmptyWidget(),
          ),
          onError: (e) => AppErrorWidget(
            title: e,
            onRetry: () {
              controller.getKhataNumberByKsrNbr();
            },
          ),
        ),
      ),
    );
  }
}
