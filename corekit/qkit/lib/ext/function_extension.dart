import 'dart:async';

import 'package:flutter/material.dart';

extension FunctionExt on Function {
  /// 节流：函数执行完成前，不再响应下一次的调用
  VoidCallback throttle() {
    return FunctionProxy(this).throttle;
  }

  /// 超时节流：超时时间后，响应下一次的调用，无论前一次调用是否已完成
  VoidCallback throttleWithTimeout({int? timeoutMs}) {
    return FunctionProxy(this, timeoutMs: timeoutMs).throttleWithTimeout;
  }

  /// 去抖动：超时时间后再响应一次调用，超时时间内再调用则时间重新计算
  VoidCallback debounce({int? timeoutMs}) {
    return FunctionProxy(this, timeoutMs: timeoutMs).debounce;
  }
}

class FunctionProxy {
  static final Map<String, bool> _funcThrottle = {};
  static final Map<String, Timer> _funcDebounce = {};
  final Function? target;

  final int timeoutMs;

  FunctionProxy(this.target, {int? timeoutMs}) : timeoutMs = timeoutMs ?? 500;

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

  void throttleWithTimeout() {
    String key = hashCode.toString();
    bool enable = _funcThrottle[key] ?? true;
    if (enable) {
      _funcThrottle[key] = false;
      Timer(Duration(milliseconds: timeoutMs), () {
        _funcThrottle.remove(key);
      });
      target?.call();
    }
  }

  void debounce() {
    String key = hashCode.toString();
    Timer? timer = _funcDebounce[key];
    timer?.cancel();
    timer = Timer(Duration(milliseconds: timeoutMs), () {
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
    Function(dynamic value)? onCompleted,
    Function(dynamic error)? onError,
    Function? onNotComplete,
  }) async {
    await FutureProxy(this).throttle(
      onCompleted: onCompleted,
      onError: onError,
      onNotComplete: onNotComplete,
    );
  }

  /// 超时节流：超时时间后，响应下一次的调用，无论前一次调用是否已完成
  Future<void> throttleWithTimeout({
    int? timeout_mill,
    Function(dynamic value)? onCompleted,
    Function(dynamic error)? onError,
    Function? onNotComplete,
  }) async {
    await FutureProxy(this, timeoutMs: timeout_mill).throttleWithTimeout(
      onCompleted: onCompleted,
      onError: onError,
      onNotComplete: onNotComplete,
    );
  }

  /// 去抖动：超时时间后再响应一次调用，超时时间内再调用则时间重新计算
  Future<void> debounce({
    int? timeoutMs,
    Function(dynamic value)? onCompleted,
    Function(dynamic error)? onError,
    Function? onNotComplete,
  }) async {
    await FutureProxy(this, timeoutMs: timeoutMs).debounce(
      onCompleted: onCompleted,
      onError: onError,
      onNotComplete: onNotComplete,
    );
  }
}

class FutureProxy {
  static final Map<String, bool> _funcThrottle = {};
  static final Map<String, Timer> _funcDebounce = {};
  final Future? target;

  final int timeoutMs;

  FutureProxy(this.target, {int? timeoutMs}) : timeoutMs = timeoutMs ?? 500;

  Future<void> throttle({
    Function(dynamic value)? onCompleted,
    Function(dynamic error)? onError,
    Function? onNotComplete,
  }) async {
    String key = hashCode.toString();
    bool enable = _funcThrottle[key] ?? true;
    if (enable) {
      _funcThrottle[key] = false;
      await target?.then((value) {
        onCompleted?.call(value);
      }).catchError((error) {
        onError?.call(error);
      }).whenComplete(() {
        _funcThrottle.remove(key);
      });
    }

    onNotComplete?.call();
  }

  Future<void> throttleWithTimeout({
    Function(dynamic value)? onCompleted,
    Function(dynamic error)? onError,
    Function? onNotComplete,
  }) async {
    String key = hashCode.toString();
    bool enable = _funcThrottle[key] ?? true;
    if (enable) {
      _funcThrottle[key] = false;
      Timer(Duration(milliseconds: timeoutMs), () {
        _funcThrottle.remove(key);
      });
      await target?.then((value) {
        onCompleted?.call(value);
      }).catchError((error) {
        onError?.call(error);
      }).whenComplete(() {
        _funcThrottle.remove(key);
      });
    }

    onNotComplete?.call();
  }

  Future<void> debounce({
    Function(dynamic value)? onCompleted,
    Function(dynamic error)? onError,
    Function? onNotComplete,
  }) async {
    String key = hashCode.toString();
    Timer? timer = _funcDebounce[key];
    if (timer != null) {
      onNotComplete?.call();
    }

    timer?.cancel();
    timer = Timer(Duration(milliseconds: timeoutMs), () async {
      Timer? t = _funcDebounce.remove(key);
      t?.cancel();
      await target?.then((value) {
        onCompleted?.call(value);
      }).catchError((error) {
        onError?.call(error);
      }).whenComplete(() {
        _funcThrottle.remove(key);
      });
    });
    _funcDebounce[key] = timer;
  }
}
