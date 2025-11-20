import 'package:balmoranews/core/di.dart';
import 'package:balmoranews/core/interface/screen_module/screen_controller.dart';
import 'package:balmoranews/core/interface/screen_module/screen_locator.dart';
import 'package:flutter/widgets.dart';

class NewsListScreenParams extends ScreenControllerParams {}

class NewsListScreenController extends ScreenController<NewsListScreenParams> {
  NewsListScreenController(super.params);

  String get privacyPolicyUrl => env.privacyPolicyUrl;
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
