import 'package:qkit/qkit.dart';

class RawData {
  dynamic _data;

  /// 原始数据
  dynamic get raw => _data;

  RawData(dynamic data) {
    _data = data;
  }

  RawData copy_with(dynamic data) {
    return RawData(data);
  }

  /// 反序列化为T类型数据，存在反序列化器时返回对象
  T as<T>({T Function(Map<String, dynamic>)? object_convertor}) {
    _nullDataCheck();

    if (QKitUtils.is_dart_base_data_type(T)) {
      return _data as T;
    }
    return _as_object<T>(_data, object_convertor: object_convertor);
  }

  /// 依据是否存在返回序列化器处理反序列化数据
  T _as_object<T>(dynamic data, {T Function(Map<String, dynamic>)? object_convertor}) {
    return null != object_convertor ? object_convertor.call((data as Map<String, dynamic>)) : data as T;
  }

  /// 反序列化为T?类型数据，存在反序列化器时返回对象
  T? as_nil<T>({T? Function(Map<String, dynamic>)? object_convertor}) {
    if (QKitUtils.is_dart_base_data_type(T)) {
      return _data == null ? null : _data as T;
    }
    return _as_object_nil<T>(_data, object_convertor: object_convertor);
  }

  /// 依据是否存在返回序列化器处理反序列化数据
  T? _as_object_nil<T>(dynamic data, {T? Function(Map<String, dynamic>)? object_convertor}) {
    if (null == data) {
      return null;
    } else {
      return null != object_convertor ? object_convertor.call((data as Map<String, dynamic>)) : data as T;
    }
  }

  /// 反序列化为T类型数据数组，存在反序列化器时返回对象数组
  List<T> as_list<T>({T Function(Map<String, dynamic>)? object_convertor}) {
    _nullDataCheck();

    List<dynamic> list = _data as List<dynamic>;
    if (QKitUtils.is_dart_base_data_type(T)) {
      return list.map((item) => item as T).toList();
    }

    return list
        .map((item) => _as_object<T>(
              item,
              object_convertor: object_convertor,
            ))
        .toList();
  }

  /// 反序列化为T类型数据数组，存在反序列化器时返回对象数组
  List<T>? as_nil_list<T>({T Function(Map<String, dynamic>)? object_convertor}) {
    if (null == _data) {
      return null;
    }

    List<dynamic> list = _data as List<dynamic>;
    if (QKitUtils.is_dart_base_data_type(T)) {
      return list.map((item) => item as T).toList();
    }

    return list.map((item) => _as_object<T>(item, object_convertor: object_convertor)).toList();
  }

  /// 反序列化为KV键值对
  Map<String, dynamic> as_map() {
    _nullDataCheck();
    return _data as Map<String, dynamic>;
  }

  void _nullDataCheck() {
    if (null == _data) {
      PPLog.singl.error('Used RawData._data NPE fail');
    }
  }
}
