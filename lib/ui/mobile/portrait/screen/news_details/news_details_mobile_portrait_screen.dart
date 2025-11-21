import 'package:balmoranews/ui/common/export.dart';
import 'package:flutter/cupertino.dart';

class NewsDetailsMobilePortraitScreen extends StatelessWidget {
  const NewsDetailsMobilePortraitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: nothing,
      child: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: backgroundBalmoraPortraitAssetImage,
              fit: BoxFit.fitHeight,
            ),
          ),
          Center(
            child: Padding(
              padding: adaptiveLTRB(16, 64, 16, 32),
              child: AdaptiveSize(
                width: 375,
                height: 812,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: Image(
                        width: adaptiveWidth(375),
                        height: adaptiveHeight(812),
                        image: backgroundPortraitAssetImage,
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
