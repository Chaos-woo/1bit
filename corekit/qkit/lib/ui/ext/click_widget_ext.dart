import 'package:flutter/material.dart';
import 'package:qkit/qkit.dart';

enum ClickType {
  /// 点击一次执行一次函数
  none,

  /// 节流：函数执行完成前，不再响应下一次的调用
  throttle,

  /// 超时节流：超时时间后，响应下一次的调用，无论前一次调用是否已完成
  throttleWithTimeout,

  /// 去抖动：超时时间后再响应一次调用，超时时间内再调用则时间重新计算
  debounce,
}

extension WidgetTapExt on Widget {
  Widget clickEffect({
    required Function()? onTap,
    ClickType type = ClickType.throttle,
    int? timeoutMs,
    bool? effect,
  }) {
    return (effect ?? false)
        ? InkWell(
            onTap: _getOnTap(type, onTap, timeoutMs),
            child: this,
          )
        : GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _getOnTap(type, onTap, timeoutMs),
            child: this,
          );
  }

  Function()? _getOnTap(ClickType type, Function()? onTap, int? timeoutMs) {
    if (type == ClickType.throttle) {
      return onTap?.throttle();
    } else if (type == ClickType.throttleWithTimeout) {
      return onTap?.throttleWithTimeout(timeoutMs: timeoutMs);
    } else if (type == ClickType.debounce) {
      return onTap?.debounce(timeoutMs: timeoutMs);
    }
    return () => onTap?.call();
  }
}
