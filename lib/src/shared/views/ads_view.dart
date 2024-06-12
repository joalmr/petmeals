import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logger/logger.dart';
import 'package:petmeals/src/core/utils/constant/constant.dart' as global;

class AdsView extends StatelessWidget {
  final Widget child;
  AdsView({super.key, required this.child});

  final BannerAd banner = BannerAd(
    size: AdSize.banner,
    adUnitId: global.adUnitId,
    request: const AdRequest(),
    listener: BannerAdListener(
      onAdLoaded: (ad) => Logger().i("Ad loaded"),
      onAdFailedToLoad: (ad, error) {
        ad.dispose();
        Logger().e("Ad failed to load:");
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    banner.load();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: child),
            SizedBox(
              width: banner.size.width.toDouble(),
              height: banner.size.height.toDouble(),
              child: AdWidget(ad: banner),
            ),
          ],
        ),
      ),
    );
  }
}
