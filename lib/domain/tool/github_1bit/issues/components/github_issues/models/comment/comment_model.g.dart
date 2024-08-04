// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      id: json['id'] as int,
      nodeId: json['node_id'] as String,
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
      body: json['body'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: const YYYY_MM_dd_T_HH_mm_ss_Z_DateTimeConverter()
          .fromJson(json['created_at'] as String),
      updatedAt: const YYYY_MM_dd_T_HH_mm_ss_Z_DateTimeConverter()
          .fromJson(json['updated_at'] as String),
      issueUrl: json['issue_url'] as String,
      authorAssociation: json['author_association'] as String,
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
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
