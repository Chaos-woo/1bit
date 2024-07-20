import 'package:json_annotation/json_annotation.dart';
import 'package:qkit/qkit.dart';

part 'github_models.g.dart';

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
  String body;

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

/// user
@JsonSerializable()
class UserModel {
  /// login
  String login;

  /// id
  int id;

  /// node_id
  @JsonKey(name: 'node_id')
  String nodeId;

  /// avatar_url
  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  /// gravatar_id
  @JsonKey(name: 'gravatar_id')
  String gravatarId;

  /// url
  String url;

  /// html_url
  @JsonKey(name: 'html_url')
  String htmlUrl;

  /// followers_url
  @JsonKey(name: 'followers_url')
  String followersUrl;

  /// following_url
  @JsonKey(name: 'following_url')
  String followingUrl;

  /// gists_url
  @JsonKey(name: 'gists_url')
  String gistsUrl;

  /// starred_url
  @JsonKey(name: 'starred_url')
  String starredUrl;

  /// subscriptions_url
  @JsonKey(name: 'subscriptions_url')
  String subscriptionsUrl;

  /// organizations_url
  @JsonKey(name: 'organizations_url')
  String organizationsUrl;

  /// repos_url
  @JsonKey(name: 'repos_url')
  String reposUrl;

  /// events_url
  @JsonKey(name: 'events_url')
  String eventsUrl;

  /// received_events_url
  @JsonKey(name: 'received_events_url')
  String receivedEventsUrl;

  /// type
  String type;

  /// site_admin
  @JsonKey(name: 'site_admin')
  bool siteAdmin;

  /// Constructor...
  UserModel({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  /// Deserializer...
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  /// Serializer...
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

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
