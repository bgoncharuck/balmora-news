import 'package:balmoranews/core/di.dart';
import 'package:balmoranews/core/interface/screen_module/screen_controller.dart';
import 'package:balmoranews/core/interface/screen_module/screen_locator.dart';
import 'package:balmoranews/data/entity/news_api/news_article.dart';
import 'package:balmoranews/logic/use_case/launch_url.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class NewsDetailsScreenParams extends ScreenControllerParams {
  NewsDetailsScreenParams({required this.article});
  final NewsArticle article;
}

class NewsDetailsScreenController
    extends ScreenController<NewsDetailsScreenParams> {
  NewsDetailsScreenController(super.params);
  NewsArticle get data => params.article;

  void back() {
    router.pop();
  }

  Future<void> openSource() async {
    await const LaunchUrl().execute(
      params: data.url,
    );
  }

  Future<void> copyUrlLink() async {
    await Clipboard.setData(ClipboardData(text: data.url));
  }
}

class NewsDetailsScreenLocator
    extends ScreenLocator<NewsDetailsScreenController> {
  const NewsDetailsScreenLocator({
    required super.controller,
    required super.child,
    super.key,
  });

  static NewsDetailsScreenController of(BuildContext context) {
    final widget = context
        .dependOnInheritedWidgetOfExactType<NewsDetailsScreenLocator>();
    if (widget == null) {
      throw FlutterError('NewsDetailsScreenLocator not found in BuildContext.');
    }
    return widget.controller;
  }
}
