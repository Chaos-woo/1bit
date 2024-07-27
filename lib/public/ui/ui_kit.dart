import 'package:cw2bit/public/ui/flutterflow_theme.dart';
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
  static void showSimpleSnackBar(
    String text, {
    BuildContext? context,
    Duration? duration,
    Color? textColor = Colors.white,
  }) {
    var bContext = context ?? Get.context!;
    ScaffoldMessenger.of(bContext).clearSnackBars();
    ScaffoldMessenger.of(bContext).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: FlutterFlowTheme.of(bContext).labelLarge.override(
                fontFamily: 'Readex Pro',
                color: textColor,
                letterSpacing: 0,
              ),
        ),
        duration: duration ?? Duration(milliseconds: 4000),
        // backgroundColor: Color(0x80000000),
      ),
    );
  }
}
