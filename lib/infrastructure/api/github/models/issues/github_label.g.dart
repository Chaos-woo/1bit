// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_label.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubLabel _$GithubLabelFromJson(Map<String, dynamic> json) => GithubLabel(
      id: json['id'] as int,
      nodeId: json['node_id'] as String,
      url: json['url'] as String,
      name: json['name'] as String,
      color: json['color'] as String,
      isDefault: json['default'] as bool,
      description: json['description'] as String,
    );

Map<String, dynamic> _$GithubLabelToJson(GithubLabel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'url': instance.url,
      'name': instance.name,
      'color': instance.color,
      'default': instance.isDefault,
      'description': instance.description,
    };
