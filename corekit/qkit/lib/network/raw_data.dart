import 'package:qkit/qkit.dart';

class RawData {
  dynamic _data;

  /// 原始数据
  dynamic get raw => _data;

  RawData(dynamic data) {
    _data = data;
  }

  RawData copyWith(dynamic data) {
    return RawData(data);
  }

  /// 反序列化为T类型数据，存在反序列化器时返回对象
  T as<T>({T Function(Map<String, dynamic>)? objectConvertor}) {
    _nullDataCheck();

    if (QKitUtils.isBaseType(T)) {
      return _data as T;
    }
    return _asObject<T>(_data, objectConvertor: objectConvertor);
  }

  /// 依据是否存在返回序列化器处理反序列化数据
  T _asObject<T>(dynamic data,
      {T Function(Map<String, dynamic>)? objectConvertor}) {
    return null != objectConvertor
        ? objectConvertor.call((data as Map<String, dynamic>))
        : data as T;
  }

  /// 反序列化为T类型数据数组，存在反序列化器时返回对象数组
  List<T> asList<T>({T Function(Map<String, dynamic>)? objectConvertor}) {
    _nullDataCheck();

    List<dynamic> list = _data as List<dynamic>;
    if (QKitUtils.isBaseType(T)) {
      return list.map((item) => item as T).toList();
    }

    return list
        .map((item) => _asObject<T>(
              item,
              objectConvertor: objectConvertor,
            ))
        .toList();
  }

  /// 反序列化为KV键值对
  Map<String, dynamic> asMap() {
    _nullDataCheck();
    return _data as Map<String, dynamic>;
  }

  void _nullDataCheck() {
    if (null == _data) {
      PPLog.singl.error('Used RawData._data NPE fail');
    }
  }
}
