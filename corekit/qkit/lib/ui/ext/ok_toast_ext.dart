import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

const _defaultToastBackgroundColor = Color(0xFF303030);
const _defaultToastAnimationDuration = Duration(milliseconds: 250);

extension OkToastExt on Widget {
  Widget okToast({
    TextStyle? textStyle,
    double radius = 10.0,
    ToastPosition position = ToastPosition.center,
    TextDirection textDirection = TextDirection.ltr,
    bool dismissOtherOnShow = true,
    bool movingOnWindowChange = true,
    Color? backgroundColor,
    EdgeInsets? textPadding,
    TextAlign? textAlign,
    bool handleTouch = false,
    OKToastAnimationBuilder? animationBuilder,
    Duration animationDuration = _defaultToastAnimationDuration,
    Curve? animationCurve,
    Duration? duration,
  }) {
    return OKToast(
      textStyle: textStyle,
      radius: radius,
      position: position,
      textDirection: textDirection,
      dismissOtherOnShow: dismissOtherOnShow,
      movingOnWindowChange: movingOnWindowChange,
      backgroundColor: backgroundColor ?? _defaultToastBackgroundColor,
      textPadding: textPadding,
      textAlign: textAlign,
      handleTouch: handleTouch,
      animationBuilder: animationBuilder,
      animationDuration: animationDuration,
      animationCurve: animationCurve,
      duration: duration,
      child: this,
    );
  }
}
