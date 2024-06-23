import 'package:flustars_flutter3/flustars_flutter3.dart';

class QSpUtilExt {
  /// put object.
  static Future<bool>? putObject(String key, Object value) {
    return SpUtil.putObject(key, value);
  }

  /// get obj.
  static T? getObj<T>(String key, T Function(Map v) converter, {T? defValue}) {
    return SpUtil.getObj(key, converter, defValue: defValue);
  }

  /// get object.
  static Map? getObject(String key) {
    return SpUtil.getObject(key);
  }

  /// put object list.
  static Future<bool>? putObjectList(String key, List<Object> list) {
    return SpUtil.putObjectList(key, list);
  }

  /// get obj list.
  static List<T>? getObjList<T>(String key, T Function(Map v) converter,
      {List<T>? defValue = const []}) {
    return SpUtil.getObjList(key, converter, defValue: defValue);
  }

  /// get object list.
  static List<Map>? getObjectList(String key) {
    return SpUtil.getObjectList(key);
  }

  /// get string.
  static String? getString(String key, {String? defValue = ''}) {
    return SpUtil.getString(key, defValue: defValue);
  }

  /// put string.
  static Future<bool>? putString(String key, String value) {
    return SpUtil.putString(key, value);
  }

  /// get bool.
  static bool? getBool(String key, {bool? defValue = false}) {
    return SpUtil.getBool(key, defValue: defValue);
  }

  /// put bool.
  static Future<bool>? putBool(String key, bool value) {
    return SpUtil.putBool(key, value);
  }

  /// get int.
  static int? getInt(String key, {int? defValue = 0}) {
    return SpUtil.getInt(key, defValue: defValue);
  }

  /// put int.
  static Future<bool>? putInt(String key, int value) {
    return SpUtil.putInt(key, value);
  }

  /// get double.
  static double? getDouble(String key, {double? defValue = 0.0}) {
    return SpUtil.getDouble(key, defValue: defValue);
  }

  /// put double.
  static Future<bool>? putDouble(String key, double value) {
    return SpUtil.putDouble(key, value);
  }

  /// get string list.
  static List<String>? getStringList(String key,
      {List<String>? defValue = const []}) {
    return SpUtil.getStringList(key, defValue: defValue);
  }

  /// put string list.
  static Future<bool>? putStringList(String key, List<String> value) {
    return SpUtil.putStringList(key, value);
  }

  /// get dynamic.
  static dynamic getDynamic(String key, {Object? defValue}) {
    return SpUtil.getDynamic(key, defValue: defValue);
  }

  /// have key.
  static bool? haveKey(String key) {
    return SpUtil.haveKey(key);
  }

  /// contains Key.
  static bool? containsKey(String key) {
    return SpUtil.containsKey(key);
  }

  /// get keys.
  static Set<String>? getKeys() {
    return SpUtil.getKeys();
  }

  /// remove.
  static Future<bool>? remove(String key) {
    return SpUtil.remove(key);
  }
}
