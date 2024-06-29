import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';

class Dimens {
  double font(double size) => ScreenUtil().getSp(size);
}

class Gap {
  Widget h(double size) => SizedBox(width: ScreenUtil().getWidth(size));

  Widget v(double size) => SizedBox(height: ScreenUtil().getHeight(size));
}

class MyDivider {
  Widget h({
    double? size,
    Color? color,
    double? thickness,
    double? indent,
    double? endIndent,
  }) =>
      Divider(
        height: size,
        color: color,
        thickness: thickness,
        indent: indent,
        endIndent: endIndent,
      );

  Widget v({
    double? size,
    Color? color,
    double? thickness,
    double? indent,
    double? endIndent,
  }) =>
      VerticalDivider(
        width: size,
        color: color,
        thickness: thickness,
        indent: indent,
        endIndent: endIndent,
      );
}
