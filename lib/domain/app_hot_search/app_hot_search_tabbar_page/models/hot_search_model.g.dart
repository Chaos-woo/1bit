// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotSearchModel _$HotSearchModelFromJson(Map<String, dynamic> json) =>
    HotSearchModel(
      index: json['index'] as int,
      content: json['content'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$HotSearchModelToJson(HotSearchModel instance) =>
    <String, dynamic>{
      'index': instance.index,
      'content': instance.content,
      'url': instance.url,
    };
