
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';

extension QBridgeRKitScreenUtilExt on ScreenUtil {
  /// screen width
  /// 屏幕 宽
  double get screenWidthExt => ScreenUtil.getInstance().screenWidth;

  /// screen height
  /// 屏幕 高
  double get screenHeightExt => ScreenUtil.getInstance().screenHeight;

  /// appBar height
  /// appBar 高
  double get appBarHeightExt => ScreenUtil.getInstance().appBarHeight;

  /// screen density
  /// 屏幕 像素密度
  double get screenDensityExt => ScreenUtil.getInstance().screenDensity;

  /// status bar Height
  /// 状态栏高度
  double get statusBarHeightExt => ScreenUtil.getInstance().statusBarHeight;

  /// screen width
  /// 当前屏幕 宽
  double getScreenW(BuildContext context) => ScreenUtil.getScreenW(context);

  /// screen height
  /// 当前屏幕 高
  double getScreenH(BuildContext context) => ScreenUtil.getScreenH(context);

  /// screen density
  /// 当前屏幕 像素密度
  double getScreenDensity(BuildContext context) => ScreenUtil.getScreenDensity(context);

  /// status bar Height
  /// 当前状态栏高度
  double getStatusBarH(BuildContext context) => ScreenUtil.getBottomBarH(context);

  /// status bar Height
  /// 当前BottomBar高度
  double getBottomBarH(BuildContext context) => ScreenUtil.getBottomBarH(context);

  /// 当前MediaQueryData
  MediaQueryData getMediaQueryData(BuildContext context) => ScreenUtil.getMediaQueryData(context);

  /// 仅支持纵屏。
  /// returns the size after adaptation according to the screen width.(unit dp or pt)
  /// 返回根据屏幕宽适配后尺寸（单位 dp or pt）
  /// size 单位 dp or pt
  double getScaleW(BuildContext context, double size) => ScreenUtil.getScaleW(context, size);

  /// 仅支持纵屏。
  /// returns the size after adaptation according to the screen height.(unit dp or pt)
  /// 返回根据屏幕高适配后尺寸 （单位 dp or pt）
  /// size unit dp or pt
  double getScaleH(BuildContext context, double size) => ScreenUtil.getScaleH(context, size);

  /// 仅支持纵屏。
  /// returns the font size after adaptation according to the screen density.
  /// 返回根据屏幕宽适配后字体尺寸
  /// fontSize 字体尺寸
  double getScaleSp(BuildContext context, double fontSize) => ScreenUtil.getScaleSp(context, fontSize);

  /// Orientation
  /// 设备方向(portrait, landscape)
  Orientation getOrientation(BuildContext context) => ScreenUtil.getOrientation(context);
  
  /// 兼容横/纵屏。
  /// 获取适配后的尺寸，兼容横/纵屏切换，适应宽，高，字体尺寸。
  /// Get the appropriate size, compatible with horizontal/vertical screen switching, can be used for wide, high, font size adaptation.
  double getAdapterSizeCtx(BuildContext context, double dp) => ScreenUtil.getAdapterSizeCtx(context, dp);

  /// 适配比率。
  /// Ratio.
  double getRatioCtx(BuildContext context) => ScreenUtil.getRatioCtx(context);
}