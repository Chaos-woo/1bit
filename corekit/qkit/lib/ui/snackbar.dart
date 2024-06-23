import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

const _defaultSnackbarBackgroundColor = Color(0xFF303030);
const _defaultSnackbarStayDuration = Duration(seconds: 3);
const _defaultSnackbarBorderRadius = 5.0;
const _defaultSnackbarMargin = EdgeInsets.symmetric(vertical: 5, horizontal: 10);
const _defaultSnackbarPadding = EdgeInsets.all(8);

class QSnackbar {
  SnackbarController show({
    String? title,
    String? message,
    Duration? duration = _defaultSnackbarStayDuration,
    Widget? icon,
    double borderRadius = _defaultSnackbarBorderRadius,
    Color? borderColor,
    double? borderWidth,
    Color backgroundColor = _defaultSnackbarBackgroundColor,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
    EdgeInsets margin = _defaultSnackbarMargin,
    EdgeInsets padding = _defaultSnackbarPadding,
    TextButton? lightButton,
    OnTap? onTap,
    SnackbarStatusCallback? onStatusChanged,
  }) {
    return _show(
      title: title,
      message: message,
      duration: duration,
      icon: icon,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      backgroundColor: backgroundColor,
      snackPosition: snackPosition,
      margin: margin,
      padding: padding,
      lightActions: lightButton,
      onStatusChanged: onStatusChanged,
      onTap: onTap,
    );
  }

  SnackbarController customShow({
    Widget? titleWidget,
    Widget? messageWidget,
    Widget? icon,
    Duration? duration = _defaultSnackbarStayDuration,
    double borderRadius = _defaultSnackbarBorderRadius,
    Color? borderColor,
    double? borderWidth,
    Color backgroundColor = _defaultSnackbarBackgroundColor,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
    EdgeInsets margin = _defaultSnackbarMargin,
    EdgeInsets padding = _defaultSnackbarPadding,
    Widget? lightActions,
    SnackbarStatusCallback? onStatusChanged,
    OnTap? onTap,
  }) {
    return _show(
      titleWidget: titleWidget,
      messageWidget: messageWidget,
      icon: icon,
      duration: duration,
      borderRadius: borderRadius,
      borderColor: borderColor,
      borderWidth: borderWidth,
      backgroundColor: backgroundColor,
      snackPosition: snackPosition,
      margin: margin,
      padding: padding,
      lightActions: lightActions,
      onStatusChanged: onStatusChanged,
      onTap: onTap,
    );
  }

  SnackbarController _show({
    String? title,
    String? message,
    Widget? titleWidget,
    Widget? messageWidget,
    Widget? icon,
    Duration? duration = _defaultSnackbarStayDuration,
    double borderRadius = _defaultSnackbarBorderRadius,
    Color? borderColor,
    double? borderWidth,
    Color backgroundColor = _defaultSnackbarBackgroundColor,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
    EdgeInsets margin = _defaultSnackbarMargin,
    EdgeInsets padding = _defaultSnackbarPadding,
    Widget? lightActions,
    SnackbarStatusCallback? onStatusChanged,
    OnTap? onTap,
  }) {
    if (title == null && message == null && titleWidget == null && messageWidget == null) {
      title = '';
    }

    if (icon == null) {
      padding = const EdgeInsets.all(12);
    }

    if ((message != null && messageWidget == null) || (title != null && titleWidget == null)) {
      final iconPadding = padding.left > 16.0 ? padding.left : 0.0;
      double minWidth = QKit.bridge.flustars.screen.screenWidth - (margin.vertical + padding.vertical);
      if (icon != null) {
        minWidth -= iconPadding;
      }
      if (lightActions != null) {
        double buttonRightPadding = (padding.right - 12 < 0) ? 4 : padding.right - 12;
        minWidth -= buttonRightPadding;
      }

      int messageMaxLines = 2;
      if (message != null && messageWidget == null) {
        if (icon != null) messageMaxLines += 1;
        if (lightActions != null) messageMaxLines += 1;
        messageMaxLines = min(messageMaxLines, 3);

        /// style参考GetSnackBar源码
        TextSpan messageSpan = TextSpan(text: message, style: const TextStyle(fontSize: 14.0, color: Colors.white));
        TextPainter painter =
            TextPainter(text: messageSpan, maxLines: messageMaxLines, textDirection: TextDirection.rtl);
        double maxWidth = QKit.bridge.flustars.screen.screenWidth * 0.75;
        if (minWidth > maxWidth) {
          double tempWidth = maxWidth;
          maxWidth = minWidth;
          minWidth = tempWidth;
        }
        painter.layout(minWidth: minWidth, maxWidth: maxWidth);
        if (painter.didExceedMaxLines) {
          messageWidget = Text(
            message,
            style: const TextStyle(fontSize: 14.0, color: Colors.white),
            maxLines: messageMaxLines,
            overflow: TextOverflow.ellipsis,
          );
        }
      }

      if (title != null && titleWidget == null) {
        int titleMaxLines = messageMaxLines == 3 ? 1 : 2;

        /// style参考GetSnackBar源码
        TextSpan titleSpan = TextSpan(
            text: message,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ));
        TextPainter painter = TextPainter(text: titleSpan, maxLines: titleMaxLines, textDirection: TextDirection.rtl);
        painter.layout(minWidth: minWidth, maxWidth: QKit.bridge.flustars.screen.screenWidth * 0.75);
        if (painter.didExceedMaxLines) {
          titleWidget = Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: titleMaxLines,
            overflow: TextOverflow.ellipsis,
          );
        }
      }
    }

    GetSnackBar snackbar = GetSnackBar(
      title: title,
      message: message,
      titleText: titleWidget,
      messageText: messageWidget,
      duration: duration,
      icon: icon,
      borderRadius: borderRadius,
      borderColor: borderColor,
      borderWidth: borderWidth,
      backgroundColor: backgroundColor,
      snackPosition: snackPosition,
      margin: margin,
      padding: padding,
      mainButton: lightActions,
      snackbarStatus: onStatusChanged,
      onTap: onTap,
    );

    return Get.showSnackbar(snackbar);
  }

  /// 关闭当前snackbar
  void closeCurrent() {
    Get.closeCurrentSnackbar();
  }

  /// 关闭所有snackbar
  void dismissAll() {
    Get.closeAllSnackbars();
  }
}
