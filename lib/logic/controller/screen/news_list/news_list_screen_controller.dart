import 'package:balmoranews/core/di.dart';
import 'package:balmoranews/core/interface/screen_module/screen_controller.dart';
import 'package:balmoranews/core/interface/screen_module/screen_locator.dart';
import 'package:balmoranews/data/entity/news_api/news_article.dart';
import 'package:balmoranews/logic/cubit/news/cubit.dart';
import 'package:balmoranews/logic/cubit/news/state/feed_item.dart';
import 'package:balmoranews/logic/cubit/news/state/state.dart';
import 'package:flutter/widgets.dart';

class NewsListScreenParams extends ScreenControllerParams {
  NewsListScreenParams({required this.cubit});
  final NewsCubit cubit;
}

class NewsListScreenController extends ScreenController<NewsListScreenParams> {
  NewsListScreenController(super.params);
  NewsCubit get cubit => params.cubit;

  List<NewsFeedItem> get items => [
    ...cubit.state.newItems,
    ...cubit.state.initialItems,
  ];

  Future<void> retry() async {
    if (cubit.state.errorType == NewsErrorType.firstLoadException) {
      await cubit.onEmptyInitialList();
    }
  }

  void goToArticleDetails(NewsArticle article) {
    final sourceName = Uri.encodeComponent(article.source.name);
    final title = Uri.encodeComponent(article.title);

    router.go('/news/details/$sourceName/$title');
  }

  Future<void> update() async {
    await cubit.update();
  }

  Future<void> nextPage() async {
    await cubit.nextPage();
  }
}

class NewsListScreenLocator extends ScreenLocator<NewsListScreenController> {
  const NewsListScreenLocator({
    required super.controller,
    required super.child,
    super.key,
  });

  static NewsListScreenController of(BuildContext context) {
    final widget = context
        .dependOnInheritedWidgetOfExactType<NewsListScreenLocator>();
    if (widget == null) {
      throw FlutterError('NewsListScreenLocator not found in BuildContext.');
    }
    return widget.controller;
  }
}
