import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// https://pub.dev/packages/adaptive_dialog
/// 需要更多样式时，参照adaptive_dialog的pubdev封装
class QDialog {
  Future<T?> showOkDialog<T>({
    String? title,
    String? message,
    List<AlertDialogAction<T>> actions = const [],
    bool barrierDismissible = true,
    VerticalDirection actionsOverflowDirection = VerticalDirection.up,
    WillPopCallback? onWillPop,
    AdaptiveDialogBuilder? builder,
  }) {
    return showAlertDialog<T>(
      context: Get.context!,
      title: title,
      message: message,
      barrierDismissible: barrierDismissible,
      actionsOverflowDirection: actionsOverflowDirection,
      onWillPop: onWillPop,
      builder: builder,
      actions: actions,
    );
  }

  Future<OkCancelResult> showOkCancelDialog({
    String? title,
    String? message,
    String? okLabel,
    String? cancelLabel,

    /// 与按钮颜色有关，设置为默认类型的action字体将会变为粗体
    OkCancelAlertDefaultType? defaultType,

    /// 与按钮颜色有关，true-破坏性颜色（例如红色）
    bool isDestructiveAction = false,
    bool barrierDismissible = true,
    VerticalDirection actionsOverflowDirection = VerticalDirection.up,
    WillPopCallback? onWillPop,
    AdaptiveDialogBuilder? builder,
  }) {
    return showOkCancelAlertDialog(
      context: Get.context!,
      title: title,
      message: message,
      okLabel: okLabel,
      cancelLabel: cancelLabel,
      barrierDismissible: barrierDismissible,
      actionsOverflowDirection: actionsOverflowDirection,
      onWillPop: onWillPop,
      builder: builder,
      defaultType: defaultType,
      isDestructiveAction: isDestructiveAction,
    );
  }
}
