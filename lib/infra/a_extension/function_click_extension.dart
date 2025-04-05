import 'dart:async';

import 'package:flutter/material.dart';

extension ClickFunctionExtension on Function {
  /// 节流：在函数执行完成前，忽略后续的调用。
  VoidCallback throttle_() {
    return FunctionProxy(this).throttle_;
  }

  /// 超时节流：在指定超时时间后，允许下一次调用，无论前一次调用是否完成。
  VoidCallback throttleInTimeout({int? timeoutMill}) {
    return FunctionProxy(this, timeoutMill: timeoutMill).throttleInTimeout;
  }

  /// 防抖：在指定超时时间内，只有最后一次调用会被执行。
  VoidCallback debounce_({int? timeoutMill}) {
    return FunctionProxy(this, timeoutMill: timeoutMill).debounce_;
  }
}

/// [FunctionProxy]类：
/// 该类用于对函数进行节流和防抖处理。
///
/// 节流（Throttle）：在一定时间内只执行一次函数。
/// 超时节流（Throttle with Timeout）：在指定超时时间后，允许下一次函数调用，无论前一次调用是否完成。
/// 防抖（Debounce）：在指定超时时间内，只有最后一次函数调用会被执行。
///
/// [target]：需要被节流或防抖处理的函数。
/// [timeoutMill]：超时时间，单位为毫秒。
final class FunctionProxy {
  /// 用来保存对应的节流状态
  static final Map<String, bool> _throttleFunctions = {};

  /// 用来保存对应的防抖倒计时
  static final Map<String, Timer> _debounceFunctions = {};
  final Function? target;

  final int timeoutMill;

  FunctionProxy(this.target, {int? timeoutMill}) : timeoutMill = timeoutMill ?? 500;

  /// 节流方法：在函数执行完成前，不再响应下一次的调用
  void throttle_() {
    String key = hashCode.toString();
    bool enable = _throttleFunctions[key] ?? true;
    if (enable) {
      _throttleFunctions[key] = false;
      try {
        target?.call();
      } catch (e) {
        rethrow;
      } finally {
        _throttleFunctions.remove(key);
      }
    }
  }

  /// 超时节流方法：超时时间后，响应下一次的调用，无论前一次调用是否已完成
  void throttleInTimeout() {
    String key = hashCode.toString();
    bool enable = _throttleFunctions[key] ?? true;
    if (enable) {
      _throttleFunctions[key] = false;
      Timer(Duration(milliseconds: timeoutMill), () {
        _throttleFunctions.remove(key);
      });
      target?.call();
    }
  }

  /// 去抖动方法：超时时间后再响应一次调用，超时时间内再调用则时间重新计算
  void debounce_() {
    String key = hashCode.toString();
    Timer? timer = _debounceFunctions[key];
    timer?.cancel();
    timer = Timer(Duration(milliseconds: timeoutMill), () {
      Timer? t = _debounceFunctions.remove(key);
      t?.cancel();
      target?.call();
    });
    _debounceFunctions[key] = timer;
  }
}

extension FutureExt on Future {
  /// 节流：Future执行完成前，不再响应下一次的调用
  Future<void> throttle_({
    Function(dynamic value)? onDone,
    Function(dynamic error)? onError,
    Function? onUnfinished,
  }) async {
    await FutureProxy(this).throttle_(
      onDone: onDone,
      onError: onError,
      onUnfinished: onUnfinished,
    );
  }

  /// 超时节流：超时时间后，响应下一次的调用，无论前一次Future是否已完成
  Future<void> throttleWithTimeout({
    int? timeoutMill,
    Function(dynamic value)? onDone,
    Function(dynamic error)? onError,
    Function? onUnfinished,
  }) async {
    await FutureProxy(this, timeoutMill: timeoutMill).throttleInTimeout(
      onDone: onDone,
      onError: onError,
      onUnfinished: onUnfinished,
    );
  }

  /// 去抖动：超时时间后再响应一次调用，超时时间内再调用则时间重新计算, 类似于按钮的去抖动操作
  Future<void> debounce({
    int? timeoutMill,
    Function(dynamic value)? onDone,
    Function(dynamic error)? onError,
    Function? onUnfinished,
  }) async {
    await FutureProxy(this, timeoutMill: timeoutMill).debounce_(
      onDone: onDone,
      onError: onError,
      onUnfinished: onUnfinished,
    );
  }
}

/// [FutureProxy]类：
/// 该类用于对Future进行节流和防抖处理。
///
/// 节流（Throttle）：在Future执行完成前，忽略后续的调用。
/// 超时节流（Throttle with Timeout）：在指定超时时间后，允许下一次Future调用，无论前一次是否完成。
/// 防抖（Debounce）：在指定超时时间内，只有最后一次Future调用会被执行。
///
/// [target]：需要被节流或防抖处理的Future。
/// [timeout_mill]：超时时间，单位为毫秒。
final class FutureProxy {
  /// 用来保存对应的节流状态
  static final Map<String, bool> _throttleFunctions = {};

  /// 用来保存对应的防抖倒计时
  static final Map<String, Timer> _debounceFunctions = {};
  final Future? target;

  final int timeout_mill;

  FutureProxy(this.target, {int? timeoutMill}) : timeout_mill = timeoutMill ?? 500;

  /// 节流方法：Future执行完成前，不再响应下一次的调用
  Future<void> throttle_({
    Function(dynamic value)? onDone,
    Function(dynamic error)? onError,
    Function? onUnfinished,
  }) async {
    String key = hashCode.toString();
    bool enable = _throttleFunctions[key] ?? true;
    if (enable) {
      _throttleFunctions[key] = false;
      await target?.then((value) {
        onDone?.call(value);
      }).catchError((error) {
        onError?.call(error);
      }).whenComplete(() {
        _throttleFunctions.remove(key);
      });
    }

    onUnfinished?.call();
  }

  /// 超时节流方法：超时时间后，响应下一次的调用，无论前一次Future是否已完成
  Future<void> throttleInTimeout({
    Function(dynamic value)? onDone,
    Function(dynamic error)? onError,
    Function? onUnfinished,
  }) async {
    String key = hashCode.toString();
    bool enable = _throttleFunctions[key] ?? true;
    if (enable) {
      _throttleFunctions[key] = false;
      Timer(Duration(milliseconds: timeout_mill), () {
        _throttleFunctions.remove(key);
      });
      await target?.then((value) {
        onDone?.call(value);
      }).catchError((error) {
        onError?.call(error);
      }).whenComplete(() {
        _throttleFunctions.remove(key);
      });
    }

    onUnfinished?.call();
  }

  /// 去抖动方法：超时时间后再响应一次调用，超时时间内再调用则时间重新计算
  Future<void> debounce_({
    Function(dynamic value)? onDone,
    Function(dynamic error)? onError,
    Function? onUnfinished,
  }) async {
    String key = hashCode.toString();
    Timer? timer = _debounceFunctions[key];
    if (timer != null) {
      onUnfinished?.call();
    }

    timer?.cancel();
    timer = Timer(Duration(milliseconds: timeout_mill), () async {
      Timer? t = _debounceFunctions.remove(key);
      t?.cancel();
      await target?.then((value) {
        onDone?.call(value);
      }).catchError((error) {
        onError?.call(error);
      }).whenComplete(() {
        _throttleFunctions.remove(key);
      });
    });
    _debounceFunctions[key] = timer;
  }
}
