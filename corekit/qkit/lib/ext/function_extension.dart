import 'dart:async';

import 'package:flutter/material.dart';

extension FunctionExt on Function {
  /// 节流：函数执行完成前，不再响应下一次的调用
  VoidCallback throttle() {
    return FunctionProxy(this).throttle;
  }

  /// 超时节流：超时时间后，响应下一次的调用，无论前一次调用是否已完成
  VoidCallback throttle_with_timeout({int? timeout_mill}) {
    return FunctionProxy(this, timeout_mill: timeout_mill).throttle_with_timeout;
  }

  /// 去抖动：超时时间后再响应一次调用，超时时间内再调用则时间重新计算
  VoidCallback debounce({int? timeout_mill}) {
    return FunctionProxy(this, timeout_mill: timeout_mill).debounce;
  }
}

class FunctionProxy {
  static final Map<String, bool> _funcThrottle = {};
  static final Map<String, Timer> _funcDebounce = {};
  final Function? target;

  final int timeout_mill;

  FunctionProxy(this.target, {int? timeout_mill}) : timeout_mill = timeout_mill ?? 500;

  void throttle() {
    String key = hashCode.toString();
    bool enable = _funcThrottle[key] ?? true;
    if (enable) {
      _funcThrottle[key] = false;
      try {
        target?.call();
      } catch (e) {
        rethrow;
      } finally {
        _funcThrottle.remove(key);
      }
    }
  }

  void throttle_with_timeout() {
    String key = hashCode.toString();
    bool enable = _funcThrottle[key] ?? true;
    if (enable) {
      _funcThrottle[key] = false;
      Timer(Duration(milliseconds: timeout_mill), () {
        _funcThrottle.remove(key);
      });
      target?.call();
    }
  }

  void debounce() {
    String key = hashCode.toString();
    Timer? timer = _funcDebounce[key];
    timer?.cancel();
    timer = Timer(Duration(milliseconds: timeout_mill), () {
      Timer? t = _funcDebounce.remove(key);
      t?.cancel();
      target?.call();
    });
    _funcDebounce[key] = timer;
  }
}

extension FutureExt on Future {
  /// 节流：函数执行完成前，不再响应下一次的调用
  Future<void> throttle({
    Function(dynamic value)? on_completed,
    Function(dynamic error)? on_error,
    Function? on_not_complete,
  }) async {
    await FutureProxy(this).throttle(
      on_completed: on_completed,
      on_error: on_error,
      on_not_complete: on_not_complete,
    );
  }

  /// 超时节流：超时时间后，响应下一次的调用，无论前一次调用是否已完成
  Future<void> throttle_with_timeout({
    int? timeout_mill,
    Function(dynamic value)? on_completed,
    Function(dynamic error)? on_error,
    Function? on_not_complete,
  }) async {
    await FutureProxy(this, timeout_mill: timeout_mill).throttle_with_timeout(
      on_completed: on_completed,
      on_error: on_error,
      on_not_complete: on_not_complete,
    );
  }

  /// 去抖动：超时时间后再响应一次调用，超时时间内再调用则时间重新计算
  Future<void> debounce({
    int? timeout_mill,
    Function(dynamic value)? on_completed,
    Function(dynamic error)? on_error,
    Function? on_not_complete,
  }) async {
    await FutureProxy(this, timeout_mill: timeout_mill).debounce(
      on_completed: on_completed,
      on_error: on_error,
      on_not_complete: on_not_complete,
    );
  }
}

class FutureProxy {
  static final Map<String, bool> _funcThrottle = {};
  static final Map<String, Timer> _funcDebounce = {};
  final Future? target;

  final int timeoutMs;

  FutureProxy(this.target, {int? timeout_mill}) : timeoutMs = timeout_mill ?? 500;

  Future<void> throttle({
    Function(dynamic value)? on_completed,
    Function(dynamic error)? on_error,
    Function? on_not_complete,
  }) async {
    String key = hashCode.toString();
    bool enable = _funcThrottle[key] ?? true;
    if (enable) {
      _funcThrottle[key] = false;
      await target?.then((value) {
        on_completed?.call(value);
      }).catchError((error) {
        on_error?.call(error);
      }).whenComplete(() {
        _funcThrottle.remove(key);
      });
    }

    on_not_complete?.call();
  }

  Future<void> throttle_with_timeout({
    Function(dynamic value)? on_completed,
    Function(dynamic error)? on_error,
    Function? on_not_complete,
  }) async {
    String key = hashCode.toString();
    bool enable = _funcThrottle[key] ?? true;
    if (enable) {
      _funcThrottle[key] = false;
      Timer(Duration(milliseconds: timeoutMs), () {
        _funcThrottle.remove(key);
      });
      await target?.then((value) {
        on_completed?.call(value);
      }).catchError((error) {
        on_error?.call(error);
      }).whenComplete(() {
        _funcThrottle.remove(key);
      });
    }

    on_not_complete?.call();
  }

  Future<void> debounce({
    Function(dynamic value)? on_completed,
    Function(dynamic error)? on_error,
    Function? on_not_complete,
  }) async {
    String key = hashCode.toString();
    Timer? timer = _funcDebounce[key];
    if (timer != null) {
      on_not_complete?.call();
    }

    timer?.cancel();
    timer = Timer(Duration(milliseconds: timeoutMs), () async {
      Timer? t = _funcDebounce.remove(key);
      t?.cancel();
      await target?.then((value) {
        on_completed?.call(value);
      }).catchError((error) {
        on_error?.call(error);
      }).whenComplete(() {
        _funcThrottle.remove(key);
      });
    });
    _funcDebounce[key] = timer;
  }
}
