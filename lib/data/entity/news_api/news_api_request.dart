import 'package:json_annotation/json_annotation.dart';

part 'news_api_request.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsApiRequest {
  const NewsApiRequest({
    required this.language,
    required this.fromTime,
    required this.toTime,
    required this.newsKeyWord,
    required this.pageSize,
    required this.page,
  });

  factory NewsApiRequest.fromJson(Map<String, dynamic> json) =>
      _$NewsApiRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NewsApiRequestToJson(this);

  NewsApiRequest copyWith({
    String? language,
    DateTime? fromTime,
    DateTime? toTime,
    String? newsKeyWord,
    int? pageSize,
    int? page,
  }) => NewsApiRequest(
    language: language ?? this.language,
    fromTime: fromTime ?? this.fromTime,
    toTime: toTime ?? this.toTime,
    newsKeyWord: newsKeyWord ?? this.newsKeyWord,
    pageSize: pageSize ?? this.pageSize,
    page: page ?? this.page,
  );

  /// ISO-639-1
  final String language;

  /// must be converted to ISO 8601
  /// oldest
  final DateTime fromTime;

  /// must be converted to ISO 8601
  /// newest
  final DateTime toTime;

  final String newsKeyWord;

  final int pageSize;
  final int page;
}
