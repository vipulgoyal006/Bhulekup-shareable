import 'package:bhulekh_uk/modules/districtPage/district_page.dart';
import 'package:bhulekh_uk/modules/khata_number/khasra_numebr.dart';
import 'package:bhulekh_uk/modules/khata_number/khata_number_page.dart';
import 'package:bhulekh_uk/modules/khata_number/search_khata_number.dart';
import 'package:bhulekh_uk/modules/report_page/html_view_page.dart';
import 'package:bhulekh_uk/modules/splashPage/splash_screen.dart';
import 'package:bhulekh_uk/modules/tehsilPage/tehsil_page.dart';
import 'package:bhulekh_uk/modules/villagePage/village_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: SplashPage.routeName,
        page: () => const SplashPage(),
        children: [
          GetPage(
            name: DistrictPage.routeName,
            participatesInRootNavigator: true,
            page: () => const DistrictPage(),
          ),
          GetPage(
            name: TehsilPage.routeName,
            participatesInRootNavigator: true,
            page: () => const TehsilPage(),
          ),
          GetPage(
            name: VillagePage.routeName,
            participatesInRootNavigator: true,
            page: () => const VillagePage(),
          ),
          GetPage(
            name: SearchKhataNumber.routeName,
            participatesInRootNavigator: true,
            page: () => const SearchKhataNumber(),
          ),
          GetPage(
            name: KhataNumberPage.routeName,
            participatesInRootNavigator: true,
            page: () => const KhataNumberPage(),
          ),
          GetPage(
            name: HtmlViewPage.routeName,
            participatesInRootNavigator: true,
            page: () => const HtmlViewPage(),
          ),
          GetPage(
            name: KhasraNumberPage.routeName,
            participatesInRootNavigator: true,
            page: () => const KhasraNumberPage(),
          ),
        ])
  ];
}
