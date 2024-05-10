import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logger/logger.dart';
import 'package:petmeals/src/constant/constant.dart' as global;

class AdsView extends StatelessWidget {
  final Widget child;
  AdsView({super.key, required this.child});

  final BannerAd banner = BannerAd(
    size: AdSize.banner,
    adUnitId: global.adUnitId,
    request: const AdRequest(),
    listener: BannerAdListener(
      onAdLoaded: (ad) => Logger().t("Ad loaded"),
      onAdFailedToLoad: (ad, error) {
        ad.dispose();
        Logger().e("Ad failed to load: $error");
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    banner.load();
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: child),
          SizedBox(
            width: banner.size.width.toDouble(),
            height: banner.size.height.toDouble(),
            child: AdWidget(ad: banner),
          ),
        ],
      ),
    );
  }
}
