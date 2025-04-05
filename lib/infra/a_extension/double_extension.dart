import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:flutter/widgets.dart';

extension DoubleEdgeInsetsExt on double {
  /// 返回一个左边距为当前 double 值的 EdgeInsetsGeometry 对象。
  ///
  /// 相当于 `EdgeInsets.only(left: this)`。
  EdgeInsetsGeometry get leftEdge => EdgeInsets.only(left: this);

  /// 返回一个左边距和上边距都为当前 double 值的 EdgeInsetsGeometry 对象。
  ///
  /// 相当于 `EdgeInsets.only(left: this, top: this)`。
  EdgeInsetsGeometry get leftTopEdge => EdgeInsets.only(left: this, top: this);

  /// 返回一个左边距和下边距都为当前 double 值的 EdgeInsetsGeometry 对象。
  ///
  /// 相当于 `EdgeInsets.only(left: this, bottom: this)`。
  EdgeInsetsGeometry get leftBottomEdge => EdgeInsets.only(left: this, bottom: this);

  /// 返回一个右边距为当前 double 值的 EdgeInsetsGeometry 对象。
  ///
  /// 相当于 `EdgeInsets.only(right: this)`。
  EdgeInsetsGeometry get rightEdge => EdgeInsets.only(right: this);

  /// 返回一个右边距和上边距都为当前 double 值的 EdgeInsetsGeometry 对象。
  ///
  /// 相当于 `EdgeInsets.only(right: this, top: this)`。
  EdgeInsetsGeometry get rightTopEdge => EdgeInsets.only(right: this, top: this);

  /// 返回一个右边距和下边距都为当前 double 值的 EdgeInsetsGeometry 对象。
  ///
  /// 相当于 `EdgeInsets.only(right: this, bottom: this)`。
  EdgeInsetsGeometry get rightBottomEdge => EdgeInsets.only(right: this, bottom: this);

  /// 返回一个上边距为当前 double 值的 EdgeInsetsGeometry 对象。
  ///
  /// 相当于 `EdgeInsets.only(top: this)`。
  EdgeInsetsGeometry get topEdge => EdgeInsets.only(top: this);

  /// 返回一个下边距为当前 double 值的 EdgeInsetsGeometry 对象。
  ///
  /// 相当于 `EdgeInsets.only(bottom: this)`。
  EdgeInsetsGeometry get bottomEdge => EdgeInsets.only(bottom: this);

  /// 返回一个垂直方向边距都为当前 double 值的 EdgeInsetsGeometry 对象。
  ///
  /// 相当于 `EdgeInsets.symmetric(vertical: this)`。
  EdgeInsetsGeometry get verticalEdge => EdgeInsets.symmetric(vertical: this);

  /// 返回一个水平方向边距都为当前 double 值的 EdgeInsetsGeometry 对象。
  ///
  /// 相当于 `EdgeInsets.symmetric(horizontal: this)`。
  EdgeInsetsGeometry get horizontalEdge => EdgeInsets.symmetric(horizontal: this);

  /// 返回一个所有边距都为当前 double 值的 EdgeInsetsGeometry 对象。
  ///
  /// 相当于 `EdgeInsets.symmetric(vertical: this, horizontal: this)`。
  EdgeInsetsGeometry get allEdge => EdgeInsets.symmetric(vertical: this, horizontal: this);

  ///  获取当前 double 值作为屏幕宽度的比例值。
  double get w => INKs.sdk.screen.getWidth(this);

  /// 获取当前 double 值作为屏幕高度的比例值。
  double get h => INKs.sdk.screen.getHeight(this);
}
