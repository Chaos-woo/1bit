import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_issues/models/issues/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:qkit/qkit.dart';

part 'comment_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CommentModel {
  /// id
  int id;

  /// node_id
  @JsonKey(name: 'node_id')
  String nodeId;

  /// url
  String url;

  /// html_url
  @JsonKey(name: 'html_url')
  String htmlUrl;

  /// body
  String body;

  /// user
  UserModel user;

  /// created_at
  @JsonKey(name: 'created_at')
  @YYYY_MM_dd_T_HH_mm_ss_Z_DateTimeConverter()
  DateTime createdAt;

  /// updated_at
  @JsonKey(name: 'updated_at')
  @YYYY_MM_dd_T_HH_mm_ss_Z_DateTimeConverter()
  DateTime updatedAt;

  /// issue_url
  @JsonKey(name: 'issue_url')
  String issueUrl;

  /// author_association
  @JsonKey(name: 'author_association')
  String authorAssociation;

  /// Constructor...
  CommentModel({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.htmlUrl,
    required this.body,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.issueUrl,
    required this.authorAssociation,
  });

  /// Deserializer...
  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);

  /// Serializer...
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
