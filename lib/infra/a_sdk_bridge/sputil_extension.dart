import 'package:flustars_flutter3/flustars_flutter3.dart';

class SpUtilBridge {
  /// 存储对象
  Future<bool>? putObject(String key, Object value) {
    return SpUtil.putObject(key, value);
  }

  /// 获取对象
  T? getObj<T>(String key, T Function(Map v) converter, {T? defaultValue}) {
    return SpUtil.getObj(key, converter, defValue: defaultValue);
  }

  /// 获取对象
  Map? getObject(String key) {
    return SpUtil.getObject(key);
  }

  /// 存储对象列表
  Future<bool>? putObjectList(String key, List<Object> list) {
    return SpUtil.putObjectList(key, list);
  }

  /// 获取对象列表
  List<T>? getObjList<T>(String key, T Function(Map v) converter, {List<T>? defaultValue = const []}) {
    return SpUtil.getObjList(key, converter, defValue: defaultValue);
  }

  /// 获取对象列表
  List<Map>? getObjectList(String key) {
    return SpUtil.getObjectList(key);
  }

  /// 获取字符串
  String? getString(String key, {String? defaultValue = ''}) {
    return SpUtil.getString(key, defValue: defaultValue);
  }

  /// 存储字符串
  Future<bool>? putString(String key, String value) {
    return SpUtil.putString(key, value);
  }

  /// 获取布尔值.
  bool? getBool(String key, {bool? defaultValue = false}) {
    return SpUtil.getBool(key, defValue: defaultValue);
  }

  /// 存储布尔值
  Future<bool>? putBool(String key, bool value) {
    return SpUtil.putBool(key, value);
  }

  /// 获取整数
  int? getInt(String key, {int? defaultValue = 0}) {
    return SpUtil.getInt(key, defValue: defaultValue);
  }

  /// 存储整数
  Future<bool>? putInt(String key, int value) {
    return SpUtil.putInt(key, value);
  }

  /// 获取浮点数
  double? getDouble(String key, {double? defaultValue = 0.0}) {
    return SpUtil.getDouble(key, defValue: defaultValue);
  }

  /// 存储浮点数
  Future<bool>? putDouble(String key, double value) {
    return SpUtil.putDouble(key, value);
  }

  /// 获取字符串列表
  List<String>? getStringList(String key, {List<String>? defaultValue = const []}) {
    return SpUtil.getStringList(key, defValue: defaultValue);
  }

  /// 存储字符串列表
  Future<bool>? putStringList(String key, List<String> value) {
    return SpUtil.putStringList(key, value);
  }

  /// 获取动态类型
  dynamic getDynamic(String key, {Object? defaultValue}) {
    return SpUtil.getDynamic(key, defValue: defaultValue);
  }

  /// 是否包含键
  bool? haveKey(String key) {
    return SpUtil.haveKey(key);
  }

  /// 是否包含键
  bool? containsKey(String key) {
    return SpUtil.containsKey(key);
  }

  /// 获取所有键
  Set<String>? getKeys() {
    return SpUtil.getKeys();
  }

  /// 移除键
  Future<bool>? removeKey(String key) {
    return SpUtil.remove(key);
  }
}
