import 'package:balmoranews/core/di.dart';
import 'package:balmoranews/core/interface/responsive_screen.dart';
import 'package:balmoranews/data/service/di.dart';
import 'package:balmoranews/logic/controller/screen/news_details/news_details_screen_controller.dart';
import 'package:balmoranews/logic/controller/screen/news_list/news_list_screen_controller.dart';
import 'package:balmoranews/logic/controller/screen/welcome/welcome_screen_controller.dart';
import 'package:balmoranews/logic/cubit/news/cubit.dart';
import 'package:balmoranews/ui/desktop/desktop_not_supported.dart';
import 'package:balmoranews/ui/mobile/album/screen/news_details/news_details_mobile_album_screen.dart';
import 'package:balmoranews/ui/mobile/album/screen/news_list/news_list_mobile_album_screen.dart';
import 'package:balmoranews/ui/mobile/album/screen/welcome/welcome_mobile_album_screen.dart';
import 'package:balmoranews/ui/mobile/portrait/screen/news_details/news_details_mobile_portrait_screen.dart';
import 'package:balmoranews/ui/mobile/portrait/screen/news_list/news_list_mobile_portrait_screen.dart';
import 'package:balmoranews/ui/mobile/portrait/screen/welcome/welcome_mobile_portrait_screen.dart';
import 'package:balmoranews/ui/tablet/tablet_not_supported.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'observers.dart';

GoRouter declarativeRouter() => GoRouter(
  observers: [di.get<RouteHistoryObserver>()],
  redirect: (BuildContext context, GoRouterState state) {
    if (state.uri.toString() == '/') {
      if (localPref.acceptanceOfPrivacyPolicy && localPref.acceptanceOfTerms) {
        return '/news';
      }
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
            final newsCubit = context.read<NewsCubit>();

            return NewsListScreenLocator(
              controller: NewsListScreenController(
                NewsListScreenParams(cubit: newsCubit),
              ),

              /// the only screen where
              /// we need to check for the internet connection
              child: const ConnectivityScreenWrapper(
                child: ResponsiveScreen(
                  mobilePortrait: NewsListMobilePortraitScreen(),
                  mobileAlbum: NewsListMobileAlbumScreen(),
                  tabletPortrait: TabletPortraitNotSupported(),
                  tabletAlbum: TabletAlbumNotSupported(),
                  desktop: DesktopNotSupported(),
                ),
              ),
            );
          },
          routes: [
            GoRoute(
              path: 'details/:sourceName/:title',
              builder: (BuildContext context, GoRouterState state) {
                final newsCubit = context.read<NewsCubit>();
                final sourceName = Uri.decodeComponent(
                  state.pathParameters['sourceName']!,
                );
                final title = Uri.decodeComponent(
                  state.pathParameters['title']!,
                );
                final allItems = [
                  ...newsCubit.state.newItems,
                  ...newsCubit.state.initialItems,
                ];
                final article = allItems
                    .where((item) => item.article != null)
                    .firstWhere(
                      (item) =>
                          item.article?.source.name == sourceName &&
                          item.article?.title == title,
                    )
                    .article!;

                return NewsDetailsScreenLocator(
                  controller: NewsDetailsScreenController(
                    NewsDetailsScreenParams(article: article),
                  ),
                  child: const ResponsiveScreen(
                    mobilePortrait: NewsDetailsMobilePortraitScreen(),
                    mobileAlbum: NewsDetailsMobileAlbumScreen(),
                    tabletPortrait: TabletPortraitNotSupported(),
                    tabletAlbum: TabletAlbumNotSupported(),
                    desktop: DesktopNotSupported(),
                  ),
                );
              },
              redirect: (BuildContext context, GoRouterState state) {
                final newsCubit = context.read<NewsCubit>();
                final sourceName = Uri.decodeComponent(
                  state.pathParameters['sourceName']!,
                );
                final title = Uri.decodeComponent(
                  state.pathParameters['title']!,
                );
                final allItems = [
                  ...newsCubit.state.newItems,
                  ...newsCubit.state.initialItems,
                ];
                final exists = allItems.any(
                  (item) =>
                      item.article?.source.name == sourceName &&
                      item.article?.title == title,
                );
                if (!exists) {
                  return '/news';
                }
                return null;
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
