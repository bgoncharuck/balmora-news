import 'package:balmoranews/logic/controller/screen/news_details/news_details_screen_controller.dart';
import 'package:balmoranews/ui/common/button/small_button.dart';
import 'package:balmoranews/ui/common/export.dart';
import 'package:balmoranews/ui/common/image/network_image.dart';
import 'package:balmoranews/ui/mobile/portrait/mobile_portrait_action_page.dart';

class NewsDetailsMobilePortraitScreen extends StatelessWidget {
  const NewsDetailsMobilePortraitScreen({super.key});

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
              image: backgroundBalmoraPortraitAssetImage,
              fit: BoxFit.fitHeight,
            ),
          ),
          MobilePortraitActionPage(
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
                width: 375,
                height: 480,
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    const SliverToBoxAdapter(
                      child: AdaptiveHeight(height: 8),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: adaptiveSymmetricInset(horizontal: 16),
                        child: AdaptiveSizeDecorated(
                          width: 350,
                          height: 350 * 9 / 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: accent),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x22000000),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: AdaptiveSize(
                              width: 350,
                              height: 350 * 9 / 16,
                              child: NetworkImageLoader(
                                url: article.urlToImage,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(child: AdaptiveHeight(height: 12)),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: adaptiveSymmetricInset(horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                article.source.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: kanit14w500.copyWith(color: secondary),
                              ),
                            ),
                            if (article.publishedAt != null) ...[
                              const AdaptiveSize(width: 8),
                              Text(
                                _formatTime(
                                  DateTime.parse(article.publishedAt!),
                                ),
                                style: poppins13w400.copyWith(
                                  color: const Color(0x99000000),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(child: AdaptiveHeight(height: 8)),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: adaptiveSymmetricInset(horizontal: 16),
                        child: Text(
                          article.title,
                          style: poppins22w600.copyWith(color: primary),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(child: AdaptiveHeight(height: 10)),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: adaptiveSymmetricInset(horizontal: 16),
                        child: Row(
                          children: [
                            if (article.author != null &&
                                article.author!.isNotEmpty) ...[
                              Flexible(
                                child: Text(
                                  'By ${article.author}',
                                  style: poppins13w400.copyWith(
                                    color: const Color(0x99000000),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const AdaptiveSize(width: 8),
                            ],
                            Container(
                              padding: adaptiveSymmetricInset(
                                horizontal: 8,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEDEDED),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                article.source.id ?? 'None',
                                style: kanit14w500.copyWith(
                                  color: const Color(0xFF111111),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(child: AdaptiveHeight(height: 14)),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: adaptiveSymmetricInset(horizontal: 16),
                        child: Text(
                          article.description ?? article.content ?? '',
                          style: poppins16w400.copyWith(color: primary),
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
