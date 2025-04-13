import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';

extension ScreenBridge on ScreenUtil {
  /// 屏幕 宽
  double get screenWidthGet => ScreenUtil.getInstance().screenWidth;

  /// 屏幕 高
  double get screenHeightGet => ScreenUtil.getInstance().screenHeight;

  /// appBar 高
  double get appbarHeightGet => ScreenUtil.getInstance().appBarHeight;

  /// 屏幕 像素密度
  double get screenDensityGet => ScreenUtil.getInstance().screenDensity;

  /// 状态栏高度
  double get statusBarHeightGet => ScreenUtil.getInstance().statusBarHeight;

  /// 当前屏幕 宽
  double getScreenW(BuildContext context) => ScreenUtil.getScreenW(context);

  /// 当前屏幕 高
  double getScreenH(BuildContext context) => ScreenUtil.getScreenH(context);

  /// 当前屏幕 像素密度
  double getScreenDensity(BuildContext context) => ScreenUtil.getScreenDensity(context);

  /// 当前状态栏高度
  double getStatusBarH(BuildContext context) => ScreenUtil.getBottomBarH(context);

  /// 当前BottomBar高度
  double getBottomBarH(BuildContext context) => ScreenUtil.getBottomBarH(context);

  /// 当前 MediaQueryData
  MediaQueryData getMediaQueryData(BuildContext context) => ScreenUtil.getMediaQueryData(context);

  /// 仅支持纵屏。
  /// 返回根据屏幕宽适配后尺寸（单位 dp or pt）
  double getScaleW(BuildContext context, double size) => ScreenUtil.getScaleW(context, size);

  /// 仅支持纵屏。
  /// 返回根据屏幕高适配后尺寸 （单位 dp or pt）
  double getScaleH(BuildContext context, double size) => ScreenUtil.getScaleH(context, size);

  /// 仅支持纵屏。
  /// 返回根据屏幕宽适配后字体尺寸
  double getScaleSp(BuildContext context, double fontSize) => ScreenUtil.getScaleSp(context, fontSize);

  /// Orientation
  /// 设备方向(portrait, landscape)
  Orientation getOrientation(BuildContext context) => ScreenUtil.getOrientation(context);

  /// 兼容横/纵屏。
  /// 获取适配后的尺寸，兼容横/纵屏切换，适应宽，高，字体尺寸
  double getAdapterSize(BuildContext context, double dp) => ScreenUtil.getAdapterSizeCtx(context, dp);

  /// 适配比率
  double getRatio(BuildContext context) => ScreenUtil.getRatioCtx(context);

  double getRatioFromContext(BuildContext context) => ScreenUtil.getRatioCtx(context);
}
