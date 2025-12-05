import 'dart:async';

import 'package:balmoranews/core/di.dart';
import 'package:balmoranews/core/init/init_widgets_binding.dart';
import 'package:balmoranews/logic/controller/screen/news_list/news_list_screen_controller.dart';
import 'package:balmoranews/logic/cubit/news/cubit.dart';
import 'package:balmoranews/logic/cubit/news/state/feed_item.dart';
import 'package:balmoranews/logic/cubit/news/state/state.dart';
import 'package:balmoranews/ui/common/export.dart';
import 'package:balmoranews/ui/common/news/feed_item.dart';
import 'package:balmoranews/ui/mobile/portrait/mobile_portrait_action_page.dart';
import 'package:balmoranews/ui/mobile/portrait/mobile_portrait_content_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewsListMobilePortraitScreen extends StatefulWidget {
  const NewsListMobilePortraitScreen({super.key});

  @override
  State<NewsListMobilePortraitScreen> createState() =>
      _NewsListMobilePortraitScreenState();
}

class _NewsListMobilePortraitScreenState
    extends State<NewsListMobilePortraitScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widgetsBinding.removeSplashScreen();
  }

  NewsListScreenController get sctl => NewsListScreenLocator.of(context);
  bool _isTopActivity = false;
  bool _isBottomActivity = false;
  bool get _anyCubitActivity => _isTopActivity || _isBottomActivity;
  late final ScrollController _scroll;

  @override
  void initState() {
    super.initState();
    _scroll = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _onScroll() {
    final pos = _scroll.position;
    if (pos.pixels <= pos.minScrollExtent) {
      unawaited(_tryUpdate());
    }
    if (pos.pixels >= pos.maxScrollExtent) {
      unawaited(_tryNextPage());
    }
  }

  Future<void> _tryUpdate() async {
    if (_anyCubitActivity) return;
    _isTopActivity = true;
    try {
      await sctl.update();
    } finally {
      if (mounted) setState(() => _isTopActivity = false);
    }
  }

  Future<void> _tryNextPage() async {
    if (_anyCubitActivity) return;
    _isBottomActivity = true;
    try {
      await sctl.nextPage();
    } finally {
      if (mounted) setState(() => _isBottomActivity = false);
    }
  }

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
          BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              final feed = sctl.items;

              if (state.initialItems.isNotEmpty) {
                return MobilePortraitContentPage(
                  child: CustomScrollView(
                    controller: _scroll,
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      if (_isTopActivity)
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: adaptiveInset(top: 2, bottom: 2),
                            child: const Center(
                              child: SpinKitSpinningLines(color: primary),
                            ),
                          ),
                        ),
                      SliverList.builder(
                        itemCount: feed.length,
                        itemBuilder: (context, index) {
                          final feedItem = feed[index];
                          if (feedItem.type == NewsFeedItemType.article) {
                            return Padding(
                              padding: adaptiveInset(bottom: 8),
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () =>
                                    sctl.goToArticleDetails(feedItem.article!),
                                child: NewsFeedItemArticle(
                                  article: feedItem.article!,
                                ),
                              ),
                            );
                          }

                          return Padding(
                            padding: adaptiveInset(bottom: 8),
                            child: NewsFeedItemDateSeparator(
                              time: feedItem.separatorDate!,
                            ),
                          );
                        },
                      ),
                      if (_isBottomActivity)
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: adaptiveInset(top: 2, bottom: 2),
                            child: const Center(
                              child: SpinKitSpinningLines(color: primary),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }

              if (state.hasError) {
                return MobilePortraitActionPage(
                  actions: [
                    PrimaryButton(
                      text: 'Retry',
                      onPressed: sctl.retry,
                    ),
                  ],
                  children: [
                    Padding(
                      padding: adaptiveInset(left: 16, right: 16),
                      child: Column(
                        children: [
                          Position(
                            align: Alignment.topCenter,
                            inset: adaptiveInset(top: 16),
                            child: Text(
                              'Balmora News',
                              style: kanit42w500.copyWith(color: primary),
                            ),
                          ),
                          Position(
                            align: Alignment.topCenter,
                            inset: adaptiveInset(top: 16),
                            child: Text(
                              'We encountered the issue',
                              style: poppins28w500.copyWith(color: primary),
                            ),
                          ),
                          Position(
                            align: Alignment.topCenter,
                            inset: adaptiveLTRB(16, 16, 16, 0),
                            child: Text(
                              state.errorMessage,
                              style: poppins18w500.copyWith(color: primary),
                              textAlign: TextAlign.center,
                              maxLines: 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }

              return const Center(
                child: SpinKitFoldingCube(
                  color: accent,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
