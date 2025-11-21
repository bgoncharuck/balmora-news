import 'package:balmoranews/core/interface/screen_module/screen_controller.dart';
import 'package:balmoranews/core/interface/screen_module/screen_locator.dart';
import 'package:flutter/widgets.dart';

class NewsDetailsScreenParams extends ScreenControllerParams {}

class NewsDetailsScreenController
    extends ScreenController<NewsDetailsScreenParams> {
  NewsDetailsScreenController(super.params);
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
