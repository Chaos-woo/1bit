import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteProxyKit {
  /// 转向至指定路由
  /// [prevent_duplicates]：重复路由至同一路由时，设置为false，且对应的Controller注意处理tag
  Future<R?>? to<R>(
    String route, {
    dynamic argument,
    Map<String, String>? path_variables,
    bool prevent_duplicates = true,
  }) {
    return Get.toNamed<R>(
      route,
      arguments: argument,
      preventDuplicates: prevent_duplicates,
      parameters: path_variables,
    );
  }

  /// 弹出当前路由并转向至指定路由
  Future<R?>? popAndTo<R>(
    String route, {
    dynamic argument,
    Map<String, String>? path_variables,
  }) {
    return Get.offAndToNamed<R>(
      route,
      arguments: argument,
      parameters: path_variables,
    );
  }

  /// 转向指定路由并在predicate参数为true前弹出路由栈中的页面
  Future<R?>? pushAndRemoveUntil<R>(
    String route, {
    RoutePredicate? predicate,
    dynamic argument,
    Map<String, String>? pathVariables,
  }) {
    return Get.offAllNamed<R>(
      route,
      predicate: predicate,
      arguments: argument,
      parameters: pathVariables,
    );
  }

  /// 返回
  void back({dynamic back_result}) {
    Get.back(result: back_result);
  }

  /// 获取当前的路由参数
  ///
  /// Like [push]/[popAndPushNamed] method, can set any
  /// type arguments that like string or object, using generic
  /// type and this method will transmit and return.
  ///
  /// e.g. push("/NextScreen", arguments: 'Get is the best');
  /// ```dart
  ///   String argument = NavigationUtils.argument('arguments');
  ///   assert(argument == 'Get is the best');
  /// ```
  T argument<T>() {
    return Get.arguments as T;
  }

  ///
  /// Get routing url parameter like web, or use Map
  /// struct to pack some properties, next page can use
  /// [path_variables] method to get it.
  ///
  /// Note: only can get [String] value.
  ///
  /// e.g. /NextScreen?device=phone&id=354&name=Enzo
  /// ```dart
  ///   String name = NavigationUtils.parameters('name');
  ///   assert('Enzo' == name);
  /// ```
  ///
  String? path_variables(String name) {
    return Get.parameters[name];
  }
}
