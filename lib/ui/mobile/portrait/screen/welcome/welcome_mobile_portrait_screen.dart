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
            child: Image(image: backgroundPortraitAssetImage, fit: BoxFit.fill),
          ),
          Center(
            child: GestureDetector(
              onTap: sctl.goToNewsList,
              child: Text(
                'Mobile Portrait Welcome.',
                style: kanit38w500.copyWith(color: primary),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
