import 'package:balmoranews/core/di.dart';
import 'package:balmoranews/core/init/init_widgets_binding.dart';
import 'package:balmoranews/logic/controller/screen/news_list/news_list_screen_controller.dart';
import 'package:balmoranews/ui/common/export.dart';
import 'package:flutter/cupertino.dart';

class NewsListMobileAlbumScreen extends StatefulWidget {
  const NewsListMobileAlbumScreen({super.key});

  @override
  State<NewsListMobileAlbumScreen> createState() =>
      _NewsListMobileAlbumScreenState();
}

class _NewsListMobileAlbumScreenState extends State<NewsListMobileAlbumScreen> {
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
            child: Image(image: backgroundAlbumAssetImage, fit: BoxFit.fill),
          ),
          Center(
            child: Text(
              'Mobile Album News List.',
              style: kanit42w500.copyWith(color: primary),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
