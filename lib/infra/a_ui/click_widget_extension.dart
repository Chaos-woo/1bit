import 'package:cw2bit/infra/a_extension/function_click_extension.dart';
import 'package:flutter/material.dart';

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

extension WidgetTapableExtension on Widget {
  Widget clickEffect({
    required Function()? onTap,
    Function()? onLongTap,
    ClickType clickType = ClickType.throttle,
    int? timeoutMs,
    bool? effect,
  }) {
    return (effect ?? false)
        ? InkWell(
            onTap: _getOnTap(clickType, onTap, timeoutMs),
            onLongPress: onLongTap,
            child: this,
          )
        : GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _getOnTap(clickType, onTap, timeoutMs),
            onLongPress: onLongTap,
            child: this,
          );
  }

  Function()? _getOnTap(ClickType type, Function()? onTap, int? timeoutMs) {
    if (type == ClickType.throttle) {
      return onTap?.throttle_();
    } else if (type == ClickType.throttleWithTimeout) {
      return onTap?.throttleInTimeout(timeoutMill: timeoutMs);
    } else if (type == ClickType.debounce) {
      return onTap?.debounce_(timeoutMill: timeoutMs);
    }
    return () => onTap?.call();
  }
}
