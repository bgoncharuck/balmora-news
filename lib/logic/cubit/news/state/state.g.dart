// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsState _$NewsStateFromJson(Map<String, dynamic> json) => NewsState(
  newItems: (json['newItems'] as List<dynamic>)
      .map((e) => NewsFeedItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  initialItems: (json['initialItems'] as List<dynamic>)
      .map((e) => NewsFeedItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  errorType: $enumDecode(_$NewsErrorTypeEnumMap, json['errorType']),
  errorMessage: json['errorMessage'] as String,
  page: (json['page'] as num).toInt(),
  hasReachedMax: json['hasReachedMax'] as bool,
  initialTime: json['initialTime'] == null
      ? null
      : DateTime.parse(json['initialTime'] as String),
  oldestTime: json['oldestTime'] == null
      ? null
      : DateTime.parse(json['oldestTime'] as String),
);

Map<String, dynamic> _$NewsStateToJson(NewsState instance) => <String, dynamic>{
  'newItems': instance.newItems.map((e) => e.toJson()).toList(),
  'initialItems': instance.initialItems.map((e) => e.toJson()).toList(),
  'errorType': _$NewsErrorTypeEnumMap[instance.errorType]!,
  'errorMessage': instance.errorMessage,
  'initialTime': instance.initialTime?.toIso8601String(),
  'oldestTime': instance.oldestTime?.toIso8601String(),
  'page': instance.page,
  'hasReachedMax': instance.hasReachedMax,
};

const _$NewsErrorTypeEnumMap = {
  NewsErrorType.none: 'none',
  NewsErrorType.emptyList: 'emptyList',
  NewsErrorType.firstLoad: 'firstLoad',
  NewsErrorType.firstLoadException: 'firstLoadException',
  NewsErrorType.exception: 'exception',
};
