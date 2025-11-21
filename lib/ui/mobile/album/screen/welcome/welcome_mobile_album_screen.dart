import 'package:balmoranews/core/di.dart';
import 'package:balmoranews/core/init/init_widgets_binding.dart';
import 'package:balmoranews/logic/controller/screen/welcome/welcome_screen_controller.dart';
import 'package:balmoranews/ui/common/export.dart';
import 'package:flutter/cupertino.dart';

class WelcomeMobileAlbumScreen extends StatefulWidget {
  const WelcomeMobileAlbumScreen({super.key});

  @override
  State<WelcomeMobileAlbumScreen> createState() =>
      _WelcomeMobileAlbumScreenState();
}

class _WelcomeMobileAlbumScreenState extends State<WelcomeMobileAlbumScreen> {
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
              fit: BoxFit.fitWidth,
            ),
          ),
          Center(
            child: Padding(
              padding: adaptiveLTRB(16, 38, 16, 80),
              child: AdaptiveSize(
                width: 812,
                height: 375,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: Image(
                        width: adaptiveHeight(812),
                        height: adaptiveWidth(375),
                        image: backgroundAlbumAssetImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      children: [
                        Position(
                          align: Alignment.topCenter,
                          inset: adaptiveInset(top: 8),
                          child: Text(
                            'Balmora News',
                            style: kanit42w500.copyWith(color: primary),
                          ),
                        ),
                        Position(
                          align: Alignment.topCenter,
                          inset: adaptiveInset(top: 2),
                          child: Text(
                            'Welcome, traveler',
                            style: poppins28w500.copyWith(color: primary),
                          ),
                        ),
                        Position(
                          align: Alignment.topCenter,
                          inset: adaptiveLTRB(16, 2, 16, 0),
                          child: Text(
                            "Before you enter the city's news "
                            'and reports,\nyou must accept '
                            'our scroll of rules',
                            style: poppins20w500.copyWith(color: primary),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Position(
                          inset: adaptiveInset(top: 4),
                          child: Text(
                            'By continuing, you agree to our',
                            style: poppins18w400.copyWith(color: primary),
                          ),
                        ),
                        Position(
                          align: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: sctl.launchPrivacyPolicy,
                                child: Text(
                                  'Privacy Policy',
                                  style: poppins18w400.copyWith(
                                    color: linkColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              Text(
                                '  &  ',
                                style: poppins18w400.copyWith(color: primary),
                              ),
                              GestureDetector(
                                onTap: sctl.launchTermsOfUse,
                                child: Text(
                                  'Terms of Use',
                                  style: poppins18w400.copyWith(
                                    color: linkColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
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
            inset: adaptiveLTRB(32, 0, 32, 16),
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
