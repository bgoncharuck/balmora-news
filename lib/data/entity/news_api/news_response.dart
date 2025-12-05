import 'package:json_annotation/json_annotation.dart';
import 'news_article.dart';

part 'news_response.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsResponse {
  const NewsResponse({
    required this.totalResults,
    required this.articles,
    required this.status,
    this.message,
    this.code,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);

  final int totalResults;
  final List<NewsArticle> articles;

  /// In the case of ok, the below two properties will not be present
  final String status;
  final String? message;
  final String? code;
}
