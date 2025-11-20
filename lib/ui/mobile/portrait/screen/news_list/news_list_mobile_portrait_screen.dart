import 'package:balmoranews/core/di.dart';
import 'package:balmoranews/core/init/init_widgets_binding.dart';
import 'package:balmoranews/logic/controller/screen/news_list/news_list_screen_controller.dart';
import 'package:balmoranews/ui/common/export.dart';
import 'package:flutter/cupertino.dart';

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

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          const Positioned.fill(
            child: Image(image: backgroundPortraitAssetImage, fit: BoxFit.fill),
          ),
          Center(
            child: Text(
              'Mobile Portrait News List.',
              style: kanit38w500.copyWith(color: primary),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
