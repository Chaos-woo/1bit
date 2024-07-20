// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_do.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Issues _$IssuesFromJson(Map<String, dynamic> json) => Issues(
      url: json['url'] as String,
      repositoryUrl: json['repository_url'] as String,
      labelsUrl: json['labels_url'] as String,
      commentsUrl: json['comments_url'] as String,
      eventsUrl: json['events_url'] as String,
      htmlUrl: json['html_url'] as String,
      id: json['id'] as int,
      nodeId: json['node_id'] as String,
      number: json['number'] as int,
      title: json['title'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      labels: (json['labels'] as List<dynamic>)
          .map((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: json['state'] as String,
      locked: json['locked'] as bool,
      comments: json['comments'] as int,
      createdAt: const YYYY_MM_dd_T_HH_mm_ss_Z_DateTimeConverter()
          .fromJson(json['created_at'] as String),
      updatedAt: const YYYY_MM_dd_T_HH_mm_ss_Z_DateTimeConverter()
          .fromJson(json['updated_at'] as String),
      authorAssociation: json['author_association'] as String,
      body: json['body'] as String,
      timelineUrl: json['timeline_url'] as String,
    );

Map<String, dynamic> _$IssuesToJson(Issues instance) => <String, dynamic>{
      'url': instance.url,
      'repository_url': instance.repositoryUrl,
      'labels_url': instance.labelsUrl,
      'comments_url': instance.commentsUrl,
      'events_url': instance.eventsUrl,
      'html_url': instance.htmlUrl,
      'id': instance.id,
      'node_id': instance.nodeId,
      'number': instance.number,
      'title': instance.title,
      'user': instance.user.toJson(),
      'labels': instance.labels.map((e) => e.toJson()).toList(),
      'state': instance.state,
      'locked': instance.locked,
      'comments': instance.comments,
      'created_at': const YYYY_MM_dd_T_HH_mm_ss_Z_DateTimeConverter()
          .toJson(instance.createdAt),
      'updated_at': const YYYY_MM_dd_T_HH_mm_ss_Z_DateTimeConverter()
          .toJson(instance.updatedAt),
      'author_association': instance.authorAssociation,
      'body': instance.body,
      'timeline_url': instance.timelineUrl,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      login: json['login'] as String,
      id: json['id'] as int,
      nodeId: json['node_id'] as String,
      avatarUrl: json['avatar_url'] as String,
      gravatarId: json['gravatar_id'] as String,
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
      followersUrl: json['followers_url'] as String,
      followingUrl: json['following_url'] as String,
      gistsUrl: json['gists_url'] as String,
      starredUrl: json['starred_url'] as String,
      subscriptionsUrl: json['subscriptions_url'] as String,
      organizationsUrl: json['organizations_url'] as String,
      reposUrl: json['repos_url'] as String,
      eventsUrl: json['events_url'] as String,
      receivedEventsUrl: json['received_events_url'] as String,
      type: json['type'] as String,
      siteAdmin: json['site_admin'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'node_id': instance.nodeId,
      'avatar_url': instance.avatarUrl,
      'gravatar_id': instance.gravatarId,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'followers_url': instance.followersUrl,
      'following_url': instance.followingUrl,
      'gists_url': instance.gistsUrl,
      'starred_url': instance.starredUrl,
      'subscriptions_url': instance.subscriptionsUrl,
      'organizations_url': instance.organizationsUrl,
      'repos_url': instance.reposUrl,
      'events_url': instance.eventsUrl,
      'received_events_url': instance.receivedEventsUrl,
      'type': instance.type,
      'site_admin': instance.siteAdmin,
    };

Label _$LabelFromJson(Map<String, dynamic> json) => Label(
      id: json['id'] as int,
      nodeId: json['node_id'] as String,
      url: json['url'] as String,
      name: json['name'] as String,
      color: json['color'] as String,
      isDefault: json['default'] as bool,
      description: json['description'] as String,
    );

Map<String, dynamic> _$LabelToJson(Label instance) => <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'url': instance.url,
      'name': instance.name,
      'color': instance.color,
      'default': instance.isDefault,
      'description': instance.description,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: json['id'] as int,
      nodeId: json['node_id'] as String,
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
      body: json['body'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: const YYYY_MM_dd_T_HH_mm_ss_Z_DateTimeConverter()
          .fromJson(json['created_at'] as String),
      updatedAt: const YYYY_MM_dd_T_HH_mm_ss_Z_DateTimeConverter()
          .fromJson(json['updated_at'] as String),
      issueUrl: json['issue_url'] as String,
      authorAssociation: json['author_association'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'body': instance.body,
      'user': instance.user.toJson(),
      'created_at': const YYYY_MM_dd_T_HH_mm_ss_Z_DateTimeConverter()
          .toJson(instance.createdAt),
      'updated_at': const YYYY_MM_dd_T_HH_mm_ss_Z_DateTimeConverter()
          .toJson(instance.updatedAt),
      'issue_url': instance.issueUrl,
      'author_association': instance.authorAssociation,
    };
