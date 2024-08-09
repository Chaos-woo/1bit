import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_issues/models/issues/label_model.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_issues/models/issues/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:qkit/qkit.dart';

part 'issues_model.g.dart';

@JsonSerializable(explicitToJson: true)
class IssuesModel {
  /// url
  String url;

  /// repository_url
  @JsonKey(name: 'repository_url')
  String repositoryUrl;

  /// labels_url
  @JsonKey(name: 'labels_url')
  String labelsUrl;

  /// comments_url
  @JsonKey(name: 'comments_url')
  String commentsUrl;

  /// events_url
  @JsonKey(name: 'events_url')
  String eventsUrl;

  /// html_url
  @JsonKey(name: 'html_url')
  String htmlUrl;

  /// id
  int id;

  /// node_id
  @JsonKey(name: 'node_id')
  String nodeId;

  /// number
  int number;

  /// title
  String title;

  /// user
  UserModel user;

  /// labels
  List<LabelModel> labels;

  /// state
  String state;

  /// locked
  bool locked;

  /// comments
  int comments;

  /// created_at
  @JsonKey(name: 'created_at')
  @YYYY_MM_dd_T_HH_mm_ss_Z_DateTimeConverter()
  DateTime createdAt;

  /// updated_at
  @JsonKey(name: 'updated_at')
  @YYYY_MM_dd_T_HH_mm_ss_Z_DateTimeConverter()
  DateTime updatedAt;

  /// author_association
  @JsonKey(name: 'author_association')
  String authorAssociation;

  /// body
  String? body;

  /// timeline_url
  @JsonKey(name: 'timeline_url')
  String timelineUrl;

  /// Constructor...
  IssuesModel({
    required this.url,
    required this.repositoryUrl,
    required this.labelsUrl,
    required this.commentsUrl,
    required this.eventsUrl,
    required this.htmlUrl,
    required this.id,
    required this.nodeId,
    required this.number,
    required this.title,
    required this.user,
    required this.labels,
    required this.state,
    required this.locked,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    required this.authorAssociation,
    required this.body,
    required this.timelineUrl,
  });

  /// Deserializer...
  factory IssuesModel.fromJson(Map<String, dynamic> json) => _$IssuesModelFromJson(json);

  /// Serializer...
  Map<String, dynamic> toJson() => _$IssuesModelToJson(this);
}
