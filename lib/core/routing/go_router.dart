import 'package:balmoranews/core/di.dart';
import 'package:balmoranews/core/interface/responsive_screen.dart';
import 'package:balmoranews/data/service/di.dart';
import 'package:balmoranews/logic/controller/screen/news_list/news_list_screen_controller.dart';
import 'package:balmoranews/logic/controller/screen/welcome/welcome_screen_controller.dart';
import 'package:balmoranews/ui/desktop/desktop_not_supported.dart';
import 'package:balmoranews/ui/mobile/album/screen/news_list/news_list_mobile_album_screen.dart';
import 'package:balmoranews/ui/mobile/album/screen/welcome/welcome_mobile_album_screen.dart';
import 'package:balmoranews/ui/mobile/portrait/screen/news_list/news_list_mobile_portrait_screen.dart';
import 'package:balmoranews/ui/mobile/portrait/screen/welcome/welcome_mobile_portrait_screen.dart';
import 'package:balmoranews/ui/tablet/tablet_not_supported.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'observers.dart';

GoRouter declarativeRouter() => GoRouter(
  observers: [di.get<RouteHistoryObserver>()],
  redirect: (BuildContext context, GoRouterState state) {
    if (localPref.acceptanceOfPrivacyPolicy && localPref.acceptanceOfTerms) {
      return '/news';
    }
    return null;
  },
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        /// context-based locator of screen controller
        /// new screen -> new controller
        return WelcomeScreenLocator(
          controller: WelcomeScreenController(WelcomeScreenParams()),
          child: const ResponsiveScreen(
            mobilePortrait: WelcomeMobilePortraitScreen(),
            mobileAlbum: WelcomeMobileAlbumScreen(),
            tabletPortrait: TabletPortraitNotSupported(),
            tabletAlbum: TabletAlbumNotSupported(),
            desktop: DesktopNotSupported(),
          ),
        );
      },
      routes: [
        GoRoute(
          path: 'news',
          builder: (BuildContext context, GoRouterState state) {
            return NewsListScreenLocator(
              controller: NewsListScreenController(NewsListScreenParams()),
              child: const ResponsiveScreen(
                mobilePortrait: NewsListMobilePortraitScreen(),
                mobileAlbum: NewsListMobileAlbumScreen(),
                tabletPortrait: TabletPortraitNotSupported(),
                tabletAlbum: TabletAlbumNotSupported(),
                desktop: DesktopNotSupported(),
              ),
            );
          },
        ),
      ],
    ),
  ],
);
