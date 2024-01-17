import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-2451593635555466/6764571519';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-2451593635555466/4761224701';
    }
    return null;
  }

  static final BannerAdListener bannerAdListener = BannerAdListener(
      onAdLoaded: (ad) => debugPrint("Ad Loaded."),
      onAdOpened: (ad) => debugPrint("Ad Opened."),
      onAdClosed: (ad) => debugPrint("Ad Closed."),
      onAdFailedToLoad: (ad, error) {
        ad.dispose();
        debugPrint("Ad failed to load: $error");
      });
}
