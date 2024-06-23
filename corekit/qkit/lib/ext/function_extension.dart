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

  void throttle() async {
    String key = hashCode.toString();
    bool enable = _funcThrottle[key] ?? true;
    if (enable) {
      _funcThrottle[key] = false;
      try {
        await target?.call();
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
