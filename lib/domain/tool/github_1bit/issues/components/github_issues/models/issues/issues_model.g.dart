// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issues_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssuesModel _$IssuesModelFromJson(Map<String, dynamic> json) => IssuesModel(
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
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      labels: (json['labels'] as List<dynamic>)
          .map((e) => LabelModel.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$IssuesModelToJson(IssuesModel instance) =>
    <String, dynamic>{
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
