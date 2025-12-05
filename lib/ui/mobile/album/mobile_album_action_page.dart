import 'package:adaptive_formula/adaptive_formula.dart';
import 'package:balmoranews/data/entity/asset_images.dart';
import 'package:flutter/widgets.dart';

class MobileAlbumActionPage extends StatelessWidget {
  const MobileAlbumActionPage({
    required this.actions,
    required this.children,
    super.key,
  });
  final List<Widget> actions;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: adaptiveLTRB(16, 38, 16, 80),
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
                  ...children,
                ],
              ),
            ),
          ),
        ),
        Position(
          inset: adaptiveLTRB(32, 0, 32, 16),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: actions,
            ),
          ),
        ),
      ],
    );
  }
}
