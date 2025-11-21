import 'package:adaptive_formula/adaptive_formula.dart';
import 'package:balmoranews/data/entity/news_api/news_article.dart';
import 'package:balmoranews/ui/common/color.dart';
import 'package:balmoranews/ui/common/image/network_image.dart';
import 'package:balmoranews/ui/common/text_style.dart';
import 'package:flutter/widgets.dart';

class NewsFeedItemArticle extends StatelessWidget {
  const NewsFeedItemArticle({
    required this.article,
    super.key,
  });

  final NewsArticle article;
  String _formatTime(DateTime time) =>
      // ignore: lines_longer_than_80_chars
      '${time.day.toString().padLeft(2, '0')}.${time.month.toString().padLeft(2, '0')}.${time.year.toString().padLeft(2, '0')} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: adaptiveInset(left: 16, right: 16, top: 16, bottom: 16),
      child: AdaptiveSizeDecorated(
        width: 350,
        height: 330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          // ignore: avoid_redundant_argument_values
          border: Border.all(color: accent, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              child: AdaptiveSize(
                width: 350,
                height: 350 * 9 / 16,
                child: NetworkImageLoader(url: article.urlToImage),
              ),
            ),
            const AdaptiveSize(height: 12),
            Padding(
              padding: adaptiveSymmetricInset(horizontal: 14),
              child: Text(
                article.source.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: kanit14w500.copyWith(
                  color: secondary,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: adaptiveSymmetricInset(horizontal: 14),
              child: Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: poppins18w500.copyWith(
                  color: primary,
                ),
              ),
            ),
            const AdaptiveSize(height: 8),
            if (article.publishedAt != null)
              Padding(
                padding: adaptiveSymmetricInset(horizontal: 14),
                child: Text(
                  _formatTime(DateTime.parse(article.publishedAt!)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: poppins13w400.copyWith(
                    color: const Color(0x99000000),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class NewsFeedItemDateSeparator extends StatelessWidget {
  const NewsFeedItemDateSeparator({
    required this.time,
    super.key,
  });
  final DateTime time;

  String get _format =>
      // ignore: lines_longer_than_80_chars
      '${time.day.toString().padLeft(2, '0')}.${time.month.toString().padLeft(2, '0')} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: adaptiveSymmetricInset(vertical: 12, horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFFE5E5E5),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: adaptiveSymmetricInset(
                  vertical: 6,
                  horizontal: 10,
                ),
                child: Text(
                  _format,
                  style: kanit14w500.copyWith(
                    color: const Color(0xFF111111),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
