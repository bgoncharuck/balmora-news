// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsArticle _$NewsArticleFromJson(Map<String, dynamic> json) => NewsArticle(
  source: NewsSource.fromJson(json['source'] as Map<String, dynamic>),
  author: json['author'] as String?,
  title: json['title'] as String,
  description: json['description'] as String?,
  url: json['url'] as String,
  urlToImage: json['urlToImage'] as String?,
  publishedAt: json['publishedAt'] as String?,
  content: json['content'] as String?,
);

Map<String, dynamic> _$NewsArticleToJson(NewsArticle instance) =>
    <String, dynamic>{
      'source': instance.source.toJson(),
      'author': instance.author,
      'title': instance.title,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'url': instance.url,
      'description': instance.description,
      'content': instance.content,
    };

NewsSource _$NewsSourceFromJson(Map<String, dynamic> json) =>
    NewsSource(id: json['id'] as String?, name: json['name'] as String);

Map<String, dynamic> _$NewsSourceToJson(NewsSource instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
