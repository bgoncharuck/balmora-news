import 'package:balmoranews/core/di.dart';
import 'package:balmoranews/core/interface/screen_module/screen_controller.dart';
import 'package:balmoranews/core/interface/screen_module/screen_locator.dart';
import 'package:balmoranews/logic/use_case/launch_url.dart';
import 'package:flutter/widgets.dart';

class WelcomeScreenParams extends ScreenControllerParams {}

class WelcomeScreenController extends ScreenController<WelcomeScreenParams> {
  WelcomeScreenController(super.params);

  void goToNewsList() {
    router.go('/news');
  }

  Future<void> launchPrivacyPolicy() async {
    await const LaunchUrl().execute(
      params: env.privacyPolicyUrl,
    );
  }

  Future<void> launchTermsOfUse() async {
    await const LaunchUrl().execute(
      params: env.termsOfUseUrl,
    );
  }

  Future<void> acceptAndContinue() async {
    /// technically, user may accept privacy policy but not terms
    /// and we must have the specific UI design for this situation
    /// so, for the SRP sake, they are separated
    await localPref.setAcceptanceOfPrivacyPolicy(value: true);
    await localPref.setAcceptanceOfTerms(value: true);

    router.go('/news');
  }
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
