import 'package:balmoranews/core/di.dart';
import 'package:balmoranews/core/init/init_widgets_binding.dart';
import 'package:balmoranews/logic/controller/screen/welcome/welcome_screen_controller.dart';
import 'package:balmoranews/ui/common/export.dart';
import 'package:flutter/cupertino.dart';

class WelcomeMobilePortraitScreen extends StatefulWidget {
  const WelcomeMobilePortraitScreen({super.key});

  @override
  State<WelcomeMobilePortraitScreen> createState() =>
      _WelcomeMobilePortraitScreenState();
}

class _WelcomeMobilePortraitScreenState
    extends State<WelcomeMobilePortraitScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widgetsBinding.removeSplashScreen();
  }

  WelcomeScreenController get sctl => WelcomeScreenLocator.of(context);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: nothing,
      child: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: backgroundBalmoraWelcomeAssetImage,
              fit: BoxFit.fitHeight,
            ),
          ),
          Center(
            child: Padding(
              padding: adaptiveLTRB(16, 90, 16, 54),
              child: AdaptiveSize(
                width: 375,
                height: 812,
                child: Stack(
                  children: [
                    const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      child: Image(
                        image: backgroundPortraitAssetImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
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
                            'Welcome, traveler',
                            style: poppins28w500.copyWith(color: primary),
                          ),
                        ),
                        Position(
                          align: Alignment.topCenter,
                          inset: adaptiveLTRB(16, 16, 16, 0),
                          child: Text(
                            "Before you enter the city's news\n"
                            'and reports, you must accept\n'
                            'our scroll of rules',
                            style: poppins20w500.copyWith(color: primary),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Position(
                          inset: adaptiveInset(top: 74),
                          child: Text(
                            'By continuing, you agree to our',
                            style: poppins18w400.copyWith(color: primary),
                          ),
                        ),
                        Position(
                          align: Alignment.topLeft,
                          inset: adaptiveLTRB(54, 2, 16, 0),
                          child: GestureDetector(
                            onTap: sctl.launchPrivacyPolicy,
                            child: Text(
                              '- Privacy Policy',
                              style: poppins18w400.copyWith(
                                color: linkColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        Position(
                          align: Alignment.topLeft,
                          inset: adaptiveLTRB(54, 2, 16, 0),
                          child: GestureDetector(
                            onTap: sctl.launchTermsOfUse,
                            child: Text(
                              '- Terms of Use',
                              style: poppins18w400.copyWith(
                                color: linkColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Position(
            inset: adaptiveLTRB(32, 0, 32, 110),
            child: PrimaryButton(
              text: 'Accept & Continue',
              onPressed: sctl.acceptAndContinue,
            ),
          ),
        ],
      ),
    );
  }
}
