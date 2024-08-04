import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

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
