import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class UiText {
  /// 可折叠文本
  Widget expandable_text(
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
}
