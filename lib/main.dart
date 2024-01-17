import 'dart:io';

import 'package:bhulekh_uk/app_configs/app_page_routes.dart';
import 'package:bhulekh_uk/app_configs/app_theme.dart';
import 'package:bhulekh_uk/firebase_options.dart';
import 'package:bhulekh_uk/modules/splashPage/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Portal(
      child: GetMaterialApp(
        title: 'UK Bhulekh',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        darkTheme: AppThemes.darkTheme,
        theme: AppThemes.lightTheme,
        // localizationsDelegates: const [
        //   AppLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        // ],
        initialRoute: SplashPage.routeName,
        getPages: AppPages.pages,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
