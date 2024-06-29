import 'package:json_annotation/json_annotation.dart';

/// json布尔值转换器
class JsonBoolIntConverter implements JsonConverter<bool, int> {
  const JsonBoolIntConverter();

  @override
  bool fromJson(int json) {
    return 0 == json ? false : true;
  }

  @override
  int toJson(bool object) {
    return object ? 1 : 0;
  }
}

/// json String布尔值转换器
class JsonBoolStringConverter implements JsonConverter<bool, String> {
  const JsonBoolStringConverter();

  @override
  bool fromJson(String json) {
    return 'true' == json.toLowerCase();
  }

  @override
  String toJson(bool object) {
    return object ? 'true' : 'false';
  }
}
