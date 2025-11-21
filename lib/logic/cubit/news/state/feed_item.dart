import 'package:balmoranews/data/entity/news_api/news_article.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feed_item.g.dart';

enum NewsFeedItemType {
  article,
  separator,
}

@JsonSerializable(explicitToJson: true)
class NewsFeedItem extends Equatable {
  const NewsFeedItem({
    required this.type,
    this.article,
    this.separatorDate,
  });

  factory NewsFeedItem.article(NewsArticle article) {
    return NewsFeedItem(type: NewsFeedItemType.article, article: article);
  }

  factory NewsFeedItem.separator(DateTime timestamp) {
    return NewsFeedItem(
      type: NewsFeedItemType.separator,
      separatorDate: timestamp,
    );
  }

  factory NewsFeedItem.fromJson(Map<String, dynamic> json) =>
      _$NewsFeedItemFromJson(json);

  Map<String, dynamic> toJson() => _$NewsFeedItemToJson(this);

  final NewsFeedItemType type;
  final NewsArticle? article;
  final DateTime? separatorDate;

  @override
  List<Object?> get props => [type, article, separatorDate];
}
