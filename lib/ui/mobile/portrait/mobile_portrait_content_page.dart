import 'package:adaptive_formula/adaptive_formula.dart';
import 'package:balmoranews/data/entity/asset_images.dart';
import 'package:flutter/widgets.dart';

class MobilePortraitContentPage extends StatelessWidget {
  const MobilePortraitContentPage({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: adaptiveLTRB(16, 64, 16, 32),
        child: AdaptiveSize(
          width: 375,
          height: 812,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                child: Image(
                  width: adaptiveWidth(375),
                  height: adaptiveHeight(812),
                  image: backgroundPortraitAssetImage,
                  fit: BoxFit.fill,
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
