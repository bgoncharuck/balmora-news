import 'package:adaptive_formula/adaptive_formula.dart';
import 'package:balmoranews/data/entity/asset_images.dart';
import 'package:flutter/widgets.dart';

class MobilePortraitActionPage extends StatelessWidget {
  const MobilePortraitActionPage({
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
            padding: adaptiveLTRB(16, 90, 16, 54),
            child: AdaptiveSize(
              width: 375,
              height: 812,
              child: Stack(
                children: [
                  const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: Image(
                      image: backgroundPortraitAssetImage,
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
          inset: adaptiveLTRB(32, 0, 32, 110),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
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
