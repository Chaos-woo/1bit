import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

enum EnumGithubContentType { dir, file }

class GithubContentTypeConverter implements JsonConverter<EnumGithubContentType, String> {
  final c_dir_string = "dir";
  final c_file_string = "file";

  const GithubContentTypeConverter();

  @override
  EnumGithubContentType fromJson(String json) {
    return c_file_string.isCaseInsensitiveContains(json) ? EnumGithubContentType.file : EnumGithubContentType.dir;
  }

  @override
  String toJson(EnumGithubContentType object) {
    return EnumGithubContentType.file == object ? c_file_string : c_dir_string;
  }
}
