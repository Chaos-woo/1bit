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

class GithubContentTypeConverter implements JsonConverter<GithubContentType, String> {
  final c_dir_string = "dir";
  final c_file_string = "file";

  const GithubContentTypeConverter();

  @override
  GithubContentType fromJson(String json) {
    return c_file_string.isCaseInsensitiveContains(json) ? GithubContentType.file : GithubContentType.dir;
  }

  @override
  String toJson(GithubContentType object) {
    return GithubContentType.file == object ? c_file_string : c_dir_string;
  }
}
