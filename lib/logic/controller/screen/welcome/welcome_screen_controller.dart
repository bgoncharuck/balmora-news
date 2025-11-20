import 'package:balmoranews/core/di.dart';
import 'package:balmoranews/core/interface/screen_module/screen_controller.dart';
import 'package:balmoranews/core/interface/screen_module/screen_locator.dart';
import 'package:flutter/widgets.dart';

class WelcomeScreenParams extends ScreenControllerParams {}

class WelcomeScreenController extends ScreenController<WelcomeScreenParams> {
  WelcomeScreenController(super.params);

  void goToNewsList() {
    router.go('/news');
  }

  String get privacyPolicyUrl => env.privacyPolicyUrl;
}

class WelcomeScreenLocator extends ScreenLocator<WelcomeScreenController> {
  const WelcomeScreenLocator({
    required super.controller,
    required super.child,
    super.key,
  });

  static WelcomeScreenController of(BuildContext context) {
    final widget = context
        .dependOnInheritedWidgetOfExactType<WelcomeScreenLocator>();
    if (widget == null) {
      throw FlutterError('WelcomeScreenLocator not found in BuildContext.');
    }
    return widget.controller;
  }
}
