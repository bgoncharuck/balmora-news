// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) => NewsResponse(
  totalResults: (json['totalResults'] as num).toInt(),
  articles: (json['articles'] as List<dynamic>)
      .map((e) => NewsArticle.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: json['status'] as String,
  message: json['message'] as String?,
  code: json['code'] as String?,
);

Map<String, dynamic> _$NewsResponseToJson(NewsResponse instance) =>
    <String, dynamic>{
      'totalResults': instance.totalResults,
      'articles': instance.articles.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
    };
