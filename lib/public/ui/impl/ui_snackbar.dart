import 'package:cw2bit/public/toast/snackbar_widget.dart';
import 'package:cw2bit/public/toast/title_snackbar_widget.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiSnackbar {
  /// 展示snackbar
  void show_simple_snackbar(
    String text, {
    BuildContext? context,
    Duration? duration,
    Color? backgroundColor,
    int? maxLines,
    TextOverflow? textOverflow,
    String? title,
    bool showCloseButton = false,
  }) {
    var ctx = context ?? Get.context!;
    ScaffoldMessenger.of(ctx).clearSnackBars();
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: (title == null || title.isEmpty)
            ? SnackbarWidget(
                text,
                background_color: backgroundColor ?? FlutterFlowTheme.of_none_context().tertiary,
                max_lines: maxLines,
                text_over_flow: textOverflow,
              )
            : TitleSnackbarWidget(
                text,
                title: title,
                backgroundColor: backgroundColor ?? FlutterFlowTheme.of_none_context().tertiary,
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
