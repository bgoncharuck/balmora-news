// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsApiRequest _$NewsApiRequestFromJson(Map<String, dynamic> json) =>
    NewsApiRequest(
      language: json['language'] as String,
      fromTime: DateTime.parse(json['fromTime'] as String),
      toTime: DateTime.parse(json['toTime'] as String),
      newsKeyWord: json['newsKeyWord'] as String,
      pageSize: (json['pageSize'] as num).toInt(),
      page: (json['page'] as num).toInt(),
    );

Map<String, dynamic> _$NewsApiRequestToJson(NewsApiRequest instance) =>
    <String, dynamic>{
      'language': instance.language,
      'fromTime': instance.fromTime.toIso8601String(),
      'toTime': instance.toTime.toIso8601String(),
      'newsKeyWord': instance.newsKeyWord,
      'pageSize': instance.pageSize,
      'page': instance.page,
    };
