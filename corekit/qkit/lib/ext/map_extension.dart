import 'package:qkit/network/index.dart';

/// map类型扩展
extension MapExt on Map<String, dynamic> {
  RawData getAs(String key) {
    return RawData(this[key]);
  }

  RawData getNullAs(String key) {
    return containsKey(key) ? RawData(this[key]) : RawData(null);
  }
}
