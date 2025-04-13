import 'package:flustars_flutter3/flustars_flutter3.dart';

extension ObjectUtilBridge on ObjectUtil {
  /// 如果字符串为null或长度为0，则返回true。
  bool isEmptyString(String? str) => ObjectUtil.isEmptyString(str);

  /// 如果列表为null或长度为0，则返回true。
  bool isEmptyList(Iterable? list) => ObjectUtil.isEmptyList(list);

  /// 如果map中没有键/值对，则返回true。
  bool isEmptyMap(Map? map) => ObjectUtil.isEmptyMap(map);

  /// 如果String、List或Map为空，则返回true。
  bool isEmpty(Object? object) => ObjectUtil.isEmpty(object);

  /// 如果String、List或Map不为空，则返回true。
  bool isNotEmpty(Object? object) => ObjectUtil.isNotEmpty(object);

  /// 如果两个List相等，则返回true。
  bool twoListIsEqual(List? listA, List? listB) => ObjectUtil.twoListIsEqual(listA, listB);

  /// 获取长度。
  int getLength(Object? value) => ObjectUtil.getLength(value);

  /// 判别NULL
  bool isNull(Object? object) => object == null;

  /// 判别非NULL
  bool isNotNull(Object? object) => object != null;
}
