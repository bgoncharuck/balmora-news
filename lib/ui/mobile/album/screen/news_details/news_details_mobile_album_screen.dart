import 'package:balmoranews/ui/common/export.dart';
import 'package:flutter/cupertino.dart';

class NewsDetailsMobileAlbumScreen extends StatelessWidget {
  const NewsDetailsMobileAlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: nothing,
      child: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: backgroundBalmoraAlbumAssetImage,
              fit: BoxFit.fitWidth,
            ),
          ),
          Center(
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
