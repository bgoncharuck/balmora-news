/// isWeb, isMobile, and so on are `dart.library.`-specific import logic
import 'package:balmoranews/data/service/platform_is/platform_is.dart';
import 'package:flutter/widgets.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({
    required this.mobilePortrait,
    required this.mobileAlbum,
    required this.tabletPortrait,
    required this.tabletAlbum,
    required this.desktop,
    super.key,
  });

  final Widget mobilePortrait;
  final Widget mobileAlbum;
  final Widget tabletPortrait;
  final Widget tabletAlbum;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isPortrait = constraints.maxHeight > constraints.maxWidth;
        final shortestSide = isPortrait
            ? constraints.maxWidth
            : constraints.maxHeight;
        final isTablet = shortestSide >= 600;

        if (isNotWeb) {
          if (isDesktop) {
            return desktop;
          } else if (isMobile) {
            if (isTablet) {
              if (isPortrait) {
                return tabletPortrait;
              } else {
                return tabletAlbum;
              }
            } else {
              if (isPortrait) {
                return mobilePortrait;
              } else {
                return mobileAlbum;
              }
            }
          }
        } else if (isAnyWeb) {
          /// 1024x768 minus system menu
          final isDesktopScreen = shortestSide >= 750;
          if (isDesktopScreen) {
            return desktop;
          } else if (isTablet) {
            if (isPortrait) {
              return tabletPortrait;
            } else {
              return tabletAlbum;
            }
          } else {
            if (isPortrait) {
              return mobilePortrait;
            } else {
              return mobileAlbum;
            }
          }
        }

        throw Exception(
          'lib/core/interface/screen_module/responsive_screen.dart: Unsupported layout',
        );
      },
    );
  }
}
