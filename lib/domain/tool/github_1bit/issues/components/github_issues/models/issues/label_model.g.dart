// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'label_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabelModel _$LabelModelFromJson(Map<String, dynamic> json) => LabelModel(
      id: json['id'] as int,
      nodeId: json['node_id'] as String,
      url: json['url'] as String,
      name: json['name'] as String,
      color: json['color'] as String,
      isDefault: json['default'] as bool,
      description: json['description'] as String,
    );

Map<String, dynamic> _$LabelModelToJson(LabelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'url': instance.url,
      'name': instance.name,
      'color': instance.color,
      'default': instance.isDefault,
      'description': instance.description,
    };
