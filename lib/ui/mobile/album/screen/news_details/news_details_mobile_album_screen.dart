import 'package:balmoranews/logic/controller/screen/news_details/news_details_screen_controller.dart';
import 'package:balmoranews/ui/common/button/small_button.dart';
import 'package:balmoranews/ui/common/export.dart';
import 'package:balmoranews/ui/common/image/network_image.dart';
import 'package:balmoranews/ui/mobile/album/mobile_album_action_page.dart';

class NewsDetailsMobileAlbumScreen extends StatelessWidget {
  const NewsDetailsMobileAlbumScreen({super.key});

  String _formatTime(DateTime time) =>
      // ignore: lines_longer_than_80_chars
      '${time.day.toString().padLeft(2, '0')}.${time.month.toString().padLeft(2, '0')}.${time.year.toString().padLeft(2, '0')} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final sctl = NewsDetailsScreenLocator.of(context);
    final article = sctl.data;

    return CupertinoPageScaffold(
      backgroundColor: nothing,
      child: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: backgroundBalmoraAlbumAssetImage,
              fit: BoxFit.fitWidth,
            ),
          ),
          MobileAlbumActionPage(
            actions: [
              SmallButton(
                text: 'Back',
                onPressed: sctl.back,
              ),
              const AdaptiveWidth(width: 2),
              SmallButton(
                text: 'Open Source',
                onPressed: sctl.openSource,
              ),
              const AdaptiveWidth(width: 2),
              SmallButton(
                text: 'Copy Link',
                onPressed: sctl.copyUrlLink,
              ),
            ],
            children: [
              AdaptiveSize(
                width: 812,
                height: 300,
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    const SliverToBoxAdapter(child: AdaptiveHeight(height: 8)),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: adaptiveSymmetricInset(horizontal: 20),
                        child: Row(
                          children: [
                            AdaptiveSize(
                              width: adaptiveWidth(360),
                              child: NetworkImageLoader(
                                url: article.urlToImage,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: adaptiveInset(left: 12, right: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const AdaptiveSize(height: 8),
                                    Text(
                                      article.source.name,
                                      style: kanit14w500.copyWith(
                                        color: secondary,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const AdaptiveHeight(height: 8),
                                    Text(
                                      article.title,
                                      style: poppins20w600.copyWith(
                                        color: primary,
                                      ),
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const AdaptiveSize(height: 8),
                                    if (article.publishedAt != null)
                                      Text(
                                        _formatTime(
                                          DateTime.parse(
                                            article.publishedAt!,
                                          ),
                                        ),
                                        style: poppins13w400.copyWith(
                                          color: const Color(0x99000000),
                                        ),
                                      ),
                                    const AdaptiveSize(height: 10),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: Text(
                                          article.description ??
                                              article.content ??
                                              '',
                                          style: poppins15w400.copyWith(
                                            color: primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(child: AdaptiveHeight(height: 12)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
