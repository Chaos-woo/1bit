import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:styled_divider/styled_divider.dart';

class Dimens {
  double font(double size) => ScreenUtil().getSp(size);
}

class Gap {
  Widget h(double size) => SizedBox(width: ScreenUtil().getWidth(size));

  Widget v(double size) => SizedBox(height: ScreenUtil().getHeight(size));

  Widget divider(
      {required double container_width,
      double? size,
      Color? color,
      double? thickness,
      double? indent,
      double? endIndent}) {
    return SizedBox(
      width: container_width,
      child: MyDivider.h(size: size, color: color, thickness: thickness, indent: indent, endIndent: endIndent),
    );
  }

  Widget vertical_divider(
      {required double container_height,
      double? size,
      Color? color,
      double? thickness,
      double? indent,
      double? endIndent}) {
    return Container(
      height: container_height,
      child: MyDivider.v(size: size, color: color, thickness: thickness, indent: indent, endIndent: endIndent),
    );
  }
}

class MyDivider {
  static Widget h({
    double? size,
    Color? color,
    double? thickness,
    double? indent,
    double? endIndent,
    DividerLineStyle lineStyle = DividerLineStyle.solid,
  }) =>
      StyledDivider(
        color: color,
        height: size,
        thickness: thickness,
        lineStyle: lineStyle,
        indent: indent,
        endIndent: endIndent,
      );

  static Widget v({
    double? size,
    Color? color,
    double? thickness,
    double? indent,
    double? endIndent,
    DividerLineStyle lineStyle = DividerLineStyle.solid,
  }) =>
      StyledVerticalDivider(
        color: color,
        width: size,
        thickness: thickness,
        lineStyle: lineStyle,
        indent: indent,
        endIndent: endIndent,
      );
}
