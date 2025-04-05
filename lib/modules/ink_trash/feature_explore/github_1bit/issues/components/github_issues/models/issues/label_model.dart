import 'package:json_annotation/json_annotation.dart';

part 'label_model.g.dart';

/// labels
@JsonSerializable()
class LabelModel {
  /// id
  int id;

  /// node_id
  @JsonKey(name: 'node_id')
  String nodeId;

  /// url
  String url;

  /// name
  String name;

  /// color
  String color;

  /// default
  @JsonKey(name: 'default')
  bool isDefault;

  /// description
  String description;

  /// Constructor...
  LabelModel({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.name,
    required this.color,
    required this.isDefault,
    required this.description,
  });

  /// Deserializer...
  factory LabelModel.fromJson(Map<String, dynamic> json) => _$LabelModelFromJson(json);

  /// Serializer...
  Map<String, dynamic> toJson() => _$LabelModelToJson(this);
}
