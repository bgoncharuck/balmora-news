import 'package:adaptive_formula/adaptive_formula.dart';
import 'package:balmoranews/data/entity/asset_images.dart';
import 'package:flutter/widgets.dart';

class MobileAlbumContentPage extends StatelessWidget {
  const MobileAlbumContentPage({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: adaptiveLTRB(16, 60, 16, 24),
        child: AdaptiveSize(
          width: 812,
          height: 375,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Image(
                  width: adaptiveHeight(812),
                  height: adaptiveWidth(375),
                  image: backgroundAlbumAssetImage,
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
