import 'package:bhulekh_uk/app_configs/app_assets.dart';
import 'package:bhulekh_uk/app_configs/app_colors.dart';
import 'package:bhulekh_uk/app_configs/app_decorations.dart';
import 'package:bhulekh_uk/app_configs/app_validators.dart';
import 'package:bhulekh_uk/app_models/district.dart';
import 'package:bhulekh_uk/app_models/fasli_year.dart';
import 'package:bhulekh_uk/app_models/tehsil.dart';
import 'package:bhulekh_uk/app_models/village.dart';
import 'package:bhulekh_uk/modules/khata_number/controller/fasil_controller.dart';
import 'package:bhulekh_uk/modules/khata_number/controller/khasraNum_controller.dart';
import 'package:bhulekh_uk/modules/khata_number/controller/khata_controller.dart';
import 'package:bhulekh_uk/utils/snackbar_helper.dart';
import 'package:bhulekh_uk/widgets/adMob_service.dart';
import 'package:bhulekh_uk/widgets/app_buttons/app_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';

class SearchKhataNumber extends StatefulWidget {
  static const routeName = "/searchkhataNumber";

  const SearchKhataNumber({super.key});

  @override
  State<SearchKhataNumber> createState() => _SearchKhataNumberState();
}

class _SearchKhataNumberState extends State<SearchKhataNumber> {
  List<FasliYear> fasliYears = [];
  FasliYear? selectedFasliYear;
  late FasliController fasliController;
  late KhataController khataController;
  late KhasraNumController khasraNumController;
  late Village villageData;
  late District districtData;
  late Tehsil tehsilData;
  BannerAd? _banner;
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    fasliController = Get.isRegistered<FasliController>()
        ? Get.find<FasliController>()
        : Get.put(FasliController());
    khataController = Get.isRegistered<KhataController>()
        ? Get.find<KhataController>()
        : Get.put(KhataController());
    khasraNumController = Get.isRegistered<KhasraNumController>()
        ? Get.find<KhasraNumController>()
        : Get.put(KhasraNumController());
    final map = Get.arguments as Map<String, dynamic>?;
    if (map != null) {
      villageData = map['villageData'];
      districtData = map['districtData'];
      tehsilData = map['tehsilData'];
    }
    fasliController.selectedVillage = villageData;
    fasliController.getFasliYear();
    _createBannerAd();
    // _showInterstitialAd();
  }

  void _createBannerAd() {
    _banner = BannerAd(
        size: AdSize.banner,
        adUnitId: AdMobService.bannerAdUnitId!,
        listener: AdMobService.bannerAdListener,
        request: const AdRequest())
      ..load();
  }

  // void _createInterstitialAd() {
  //   InterstitialAd.load(
  //       adUnitId: AdMobService.interstitialUnitAdId!,
  //       request: const AdRequest(),
  //       adLoadCallback: InterstitialAdLoadCallback(
  //           onAdLoaded: (ad) => _interstitialAd = ad,
  //           onAdFailedToLoad: (LoadAdError error) => _interstitialAd = null));
  // }
  //
  // void _showInterstitialAd() {
  //   if (_interstitialAd != null) {
  //     _interstitialAd!.fullScreenContentCallback =
  //         FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
  //       ad.dispose();
  //       _createInterstitialAd();
  //     }, onAdFailedToShowFullScreenContent: (ad, error) {
  //       ad.dispose();
  //       _createInterstitialAd();
  //     });
  //     _interstitialAd!.show();
  //     _interstitialAd = null;
  //   }
  // }

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
      appBar: AppBar(
        backgroundColor: const Color(0xFF999900),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_rounded, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 6),
                Container(
                  width: Get.width,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                      color: const Color(0xFF999900),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "जनपद : ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "तहसील : ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "ग्राम : ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                districtData.districtName,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Text(
                                tehsilData.tehsilName,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Text(
                                villageData.vname ?? "",
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                fasliController.obx(
                  (state) => Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: DropdownButtonFormField(
                      validator: (v) => AppFormValidators.validateEmpty(v),
                      decoration:
                          AppDecorations.textFieldOutlinedDecoration().copyWith(
                        hintText: "फसली वर्ष चुनें।",
                      ),
                      isExpanded: true,
                      icon: SvgPicture.asset(AppAssets.dropDownArrow),
                      items: fasliController.names
                          .map(
                            (e) => DropdownMenuItem<FasliYear>(
                              value: e,
                              child: Text(
                                e.fasliYear == "999"
                                    ? "वर्तमान फसली"
                                    : e.fasliYear!,
                              ),
                            ),
                          )
                          .toList(),
                      value: fasliController.selectedFasliYear.value,
                      onChanged: (v) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        fasliController.selectedFasliYear.value = v;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      child: Text(
                        "किसी एक को चुनें :",
                        style: TextStyle(
                            color: Color(0xFF999900),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                RadioListTile(
                  activeColor: const Color(0xFF999900),
                  value: 1,
                  groupValue: khataController.channelType,
                  onChanged: (v) {
                    setState(() {
                      khataController.channelType = 1;
                    });
                  },
                  title: const Text("खसरा/गाटा संख्या द्वारा खोजें"),
                ),
                RadioListTile(
                  activeColor: const Color(0xFF999900),
                  value: 2,
                  groupValue: khataController.channelType,
                  onChanged: (v) {
                    setState(() {
                      khataController.channelType = 2;
                    });
                  },
                  title: const Text("खाता संख्या द्वारा खोजें"),
                ),
                RadioListTile(
                  activeColor: const Color(0xFF999900),
                  value: 3,
                  groupValue: khataController.channelType,
                  onChanged: (v) {
                    setState(() {
                      khataController.channelType = 3;
                    });
                  },
                  title: const Text("खातेदार के नाम द्वारा खोजें"),
                ),
                RadioListTile(
                  activeColor: const Color(0xFF999900),
                  value: 4,
                  groupValue: khataController.channelType,
                  onChanged: (v) {
                    setState(() {
                      khataController.channelType = 4;
                    });
                  },
                  title: const Text("नामांतरण दिनांक से खोजें"),
                ),
                khataController.channelType == 1
                    ? Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: TextFormField(
                              onSaved: khataController.onKcnSaved,
                              controller: khasraNumController.kcnTextController,
                              keyboardType: TextInputType.number,
                              textCapitalization: TextCapitalization.words,
                              decoration:
                                  AppDecorations.textFieldOutlinedDecoration()
                                      .copyWith(
                                          hintText: "खसरा/गाटा संख्या भरें..."),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: AppPrimaryButton(
                              key: khasraNumController.buttonKey,
                              color: const Color(0xFF999900),
                              onPressed: () {
                                if (fasliController.selectedFasliYear == null) {
                                  SnackBarHelper.show("फसली वर्ष चुनें !");
                                } else {
                                  khasraNumController.getKhataNumberByKsrNbr();
                                }
                              },
                              child: const Text(
                                "खोजें",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
                khataController.channelType == 2
                    ? Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: TextFormField(
                              controller:
                                  khataController.acNumberTextController,
                              keyboardType: TextInputType.number,
                              textCapitalization: TextCapitalization.words,
                              decoration:
                                  AppDecorations.textFieldOutlinedDecoration()
                                      .copyWith(
                                          hintText: "खाता संख्या भरें..."),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: AppPrimaryButton(
                              key: khataController.buttonKey,
                              color: const Color(0xFF999900),
                              onPressed: () {
                                if (fasliController.selectedFasliYear == null) {
                                  SnackBarHelper.show("फसली वर्ष चुनें !");
                                } else {
                                  khataController.enterKhataNumber();
                                }
                              },
                              child: const Text(
                                "खोजें",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
                khataController.channelType == 3
                    ? Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: TextFormField(
                              onSaved: khataController.onNameSaved,
                              keyboardType: TextInputType.name,
                              controller: khataController.nameController,
                              textCapitalization: TextCapitalization.words,
                              decoration:
                                  AppDecorations.textFieldOutlinedDecoration()
                                      .copyWith(hintText: "नाम भरें ..."),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: AppPrimaryButton(
                              key: khataController.buttonKey2,
                              color: const Color(0xFF999900),
                              onPressed: () {
                                if (fasliController.selectedFasliYear == null) {
                                  SnackBarHelper.show("फसली वर्ष चुनें !");
                                } else {
                                  khataController.getKhataNumberByName();
                                }
                              },
                              child: const Text(
                                "खोजें",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
                khataController.channelType == 4
                    ? Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: FormField<DateTime>(
                                validator: (data) =>
                                    AppFormValidators.validateDob(data),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                builder: (FormFieldState<DateTime> state) =>
                                    Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Material(
                                            color: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              side: const BorderSide(
                                                color: AppColors.divider,
                                                width: 1.2,
                                              ),
                                            ),
                                            clipBehavior: Clip.antiAlias,
                                            child: InkWell(
                                              onTap: () async {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                final now = DateTime.now()
                                                    .subtract((365 * 14).days);
                                                final date =
                                                    await showDatePicker(
                                                        context: context,
                                                        firstDate: DateTime(
                                                            1800, 1, 1, 1, 1),
                                                        lastDate: now,
                                                        initialDate: now);
                                                if (date != null) {
                                                  state.didChange(date);
                                                }
                                              },
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                20, 18, 8, 18),
                                                        child:
                                                            state.value == null
                                                                ? const Text(
                                                                    '(YYYY-DD-MM)',
                                                                    style: TextStyle(
                                                                        color: AppColors
                                                                            .subtitleGrey,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            16),
                                                                  )
                                                                : Text(
                                                                    DateFormat(
                                                                            'yyyy-MM-dd')
                                                                        .format(
                                                                            state.value!),
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            16),
                                                                  ),
                                                      ),
                                                    ),
                                                    const Icon(
                                                      Icons
                                                          .calendar_month_rounded,
                                                      color: Color(0xFF999900),
                                                    ),
                                                    const SizedBox(width: 16),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (state.hasError)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18,
                                                      vertical: 6),
                                              child: Text('${state.errorText}',
                                                  style: TextStyle(
                                                      color: Get.theme
                                                          .colorScheme.error)),
                                            )
                                        ])),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: AppPrimaryButton(
                              color: const Color(0xFF999900),
                              onPressed: () {
                                Get.dialog(SimpleDialog(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "No Data Found",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          "(कोई डेटा मौजूद नहीं)",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 10),
                                        SizedBox(
                                          width: 60,
                                          height: 40,
                                          child: AppPrimaryButton(
                                            color: const Color(0xFF999900),
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text("Ok"),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ));
                              },
                              child: const Text(
                                "खोजें",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
