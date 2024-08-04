import 'package:cw2bit/public/toast/snackbar_widget.dart';
import 'package:cw2bit/public/toast/title_snackbar_widget.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bit1Ui {
  Bit1Ui._();

  /// 可折叠文本
  static Widget expandableText(
    String longText, {
    String expandText = '展开',
    String collapseText = '折叠',
    int maxLines = 2,
    Color linkColor = Colors.blue,
    TextStyle? textStyle,
  }) {
    return ExpandableText(
      longText,
      expandText: expandText,
      collapseText: collapseText,
      maxLines: maxLines,
      linkColor: linkColor,
      style: textStyle,
    );
  }

  /// 展示snackbar
  static void showSimpleSnackbar(
    String text, {
    BuildContext? context,
    Duration? duration,
    Color? backgroundColor,
    int? maxLines,
    TextOverflow? textOverflow,
    String? title,
    bool showCloseButton = false,
  }) {
    var bContext = context ?? Get.context!;
    ScaffoldMessenger.of(bContext).clearSnackBars();
    ScaffoldMessenger.of(bContext).showSnackBar(
      SnackBar(
        content: (title == null || title.isEmpty)
            ? SnackbarWidget(
                text,
                backgroundColor: backgroundColor,
                maxLines: maxLines,
                textOverflow: textOverflow,
              )
            : TitleSnackbarWidget(
                text,
                title: title,
                backgroundColor: backgroundColor,
                maxLines: maxLines,
                textOverflow: textOverflow,
              ),
        duration: duration ?? Duration(milliseconds: 4000),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
