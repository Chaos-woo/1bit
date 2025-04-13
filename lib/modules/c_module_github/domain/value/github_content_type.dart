import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

enum GithubContentType {
  // 文件夹
  dir,
  // 文件
  file,
  // 不指定，同时包含文件夹和文件
  all,
}

extension GithubContentTypeExtension on GithubContentType {
  bool get isDir => this == GithubContentType.dir;

  bool get isFile => this == GithubContentType.file;
}

class GithubContentTypeConverter implements JsonConverter<GithubContentType, String> {
  final dirStr = "dir";
  final fileStr = "file";

  const GithubContentTypeConverter();

  @override
  GithubContentType fromJson(String json) {
    return fileStr.isCaseInsensitiveContains(json) ? GithubContentType.file : GithubContentType.dir;
  }

  @override
  String toJson(GithubContentType object) {
    return GithubContentType.file == object ? fileStr : dirStr;
  }
}
