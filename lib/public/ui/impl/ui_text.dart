import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class UiText {
  /// 可折叠文本
  Widget expandable_text(
    String text, {
    String expand_text = '展开',
    String collapse_text = '折叠',
    int max_lines = 2,
    Color link_color = Colors.blue,
    TextStyle? text_style,
  }) {
    return ExpandableText(
      text,
      expandText: expand_text,
      collapseText: collapse_text,
      maxLines: max_lines,
      linkColor: link_color,
      style: text_style,
    );
  }
}
