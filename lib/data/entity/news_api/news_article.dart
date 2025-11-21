import 'package:json_annotation/json_annotation.dart';

part 'news_article.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsArticle {
  const NewsArticle({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleFromJson(json);

  Map<String, dynamic> toJson() => _$NewsArticleToJson(this);

  final NewsSource source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
}

@JsonSerializable()
class NewsSource {
  const NewsSource({
    required this.id,
    required this.name,
  });

  factory NewsSource.fromJson(Map<String, dynamic> json) =>
      _$NewsSourceFromJson(json);

  Map<String, dynamic> toJson() => _$NewsSourceToJson(this);

  final String? id;
  final String name;
}
