import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

enum GithubContentTypeEnum { dir, file }

class GithubContentTypeConverter implements JsonConverter<GithubContentTypeEnum, String> {
  final c_dir_string = "dir";
  final c_file_string = "file";

  const GithubContentTypeConverter();

  @override
  GithubContentTypeEnum fromJson(String json) {
    return c_file_string.isCaseInsensitiveContains(json)
        ? GithubContentTypeEnum.file
        : GithubContentTypeEnum.dir;
  }

  @override
  String toJson(GithubContentTypeEnum object) {
    return GithubContentTypeEnum.file == object ? c_file_string : c_dir_string;
  }
}
