import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:cw2bit/modules/c_module_app_theme/provider/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class INKBottomSheet {
  static void show(
    Widget child, {
    Color? backgroundColor,
    Color? barrierColor,
    bool ignoreSafeArea = true,
    // 高度自定义控制，设置为true时需要child组件设置合适高度
    bool customControlHeight = false,
    // 点击BottomSheet外部是否可关闭
    bool enableDismissible = true,
    // 开启BottomSheet是否可拖拽
    bool enableDrag = true,
    ShapeBorder? shape,
    Duration? enterBottomSheetDuration,
    Duration? exitBottomSheetDuration,
  }) {
    Get.bottomSheet(
      child,
      backgroundColor: backgroundColor ?? FlutterFlowTheme.withoutContext().primaryBackground,
      barrierColor: barrierColor ?? INKs.color.barrierColor,
      ignoreSafeArea: ignoreSafeArea,
      isScrollControlled: customControlHeight,
      isDismissible: enableDismissible,
      enableDrag: enableDrag,
      shape: shape,
      enterBottomSheetDuration: enterBottomSheetDuration,
      exitBottomSheetDuration: exitBottomSheetDuration,
    );
  }
}
