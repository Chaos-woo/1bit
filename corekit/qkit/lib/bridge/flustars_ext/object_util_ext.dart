import 'package:flustars_flutter3/flustars_flutter3.dart';

extension QBridgeObjectUtilExt on ObjectUtil {
  /// Returns true if the string is null or 0-length.
  bool isEmptyString(String? str) => ObjectUtil.isEmptyString(str);

  /// Returns true if the list is null or 0-length.
  bool isEmptyList(Iterable? list) => ObjectUtil.isEmptyList(list);

  /// Returns true if there is no key/value pair in the map.
  bool isEmptyMap(Map? map) => ObjectUtil.isEmptyMap(map);

  /// Returns true  String or List or Map is empty.
  bool isEmpty(Object? object) => ObjectUtil.isEmpty(object);

  /// Returns true String or List or Map is not empty.
  bool isNotEmpty(Object? object) => ObjectUtil.isNotEmpty(object);

  /// Returns true Two List Is Equal.
  bool twoListIsEqual(List? listA, List? listB) => ObjectUtil.twoListIsEqual(listA, listB);

  /// get length.
  int getLength(Object? value) => ObjectUtil.getLength(value);
}
