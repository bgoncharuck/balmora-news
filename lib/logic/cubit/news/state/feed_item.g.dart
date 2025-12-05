// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsFeedItem _$NewsFeedItemFromJson(Map<String, dynamic> json) => NewsFeedItem(
  type: $enumDecode(_$NewsFeedItemTypeEnumMap, json['type']),
  article: json['article'] == null
      ? null
      : NewsArticle.fromJson(json['article'] as Map<String, dynamic>),
  separatorDate: json['separatorDate'] == null
      ? null
      : DateTime.parse(json['separatorDate'] as String),
);

Map<String, dynamic> _$NewsFeedItemToJson(NewsFeedItem instance) =>
    <String, dynamic>{
      'type': _$NewsFeedItemTypeEnumMap[instance.type]!,
      'article': instance.article?.toJson(),
      'separatorDate': instance.separatorDate?.toIso8601String(),
    };

const _$NewsFeedItemTypeEnumMap = {
  NewsFeedItemType.article: 'article',
  NewsFeedItemType.separator: 'separator',
};
