import 'package:json_annotation/json_annotation.dart';
import 'package:qkit/qkit.dart';

/// json时间转换器
class JsonEpochMillisecondDateTimeConverter implements JsonConverter<DateTime, int> {
  const JsonEpochMillisecondDateTimeConverter();

  @override
  DateTime fromJson(int json) {
    return DateTime.fromMillisecondsSinceEpoch(json);
  }

  @override
  int toJson(DateTime object) {
    return object.millisecondsSinceEpoch;
  }
}

/// json时间转换器
class JsonEpochSecondDateTimeConverter implements JsonConverter<DateTime, int> {
  const JsonEpochSecondDateTimeConverter();

  @override
  DateTime fromJson(int json) {
    return DateTime.fromMillisecondsSinceEpoch(json * 1000);
  }

  @override
  int toJson(DateTime object) {
    return object.millisecondsSinceEpoch ~/ 1000;
  }
}

abstract class GenericJsonDateTimeConverter implements JsonConverter<DateTime, String> {
  @override
  DateTime fromJson(String json) {
    DateTime? datetime = QKit.bridge.flustars.date.getDateTime(json);
    if (datetime == null) {
      throw Exception('Can not parse datetime from from $json');
    } else {
      return datetime;
    }
  }

  @override
  String toJson(DateTime object) {
    return QKit.bridge.flustars.date.formatDate(object, format: datetimeFormat());
  }

  String datetimeFormat();
}
