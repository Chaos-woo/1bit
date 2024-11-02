import 'package:cw2bit/public/toast/snackbar_widget.dart';
import 'package:cw2bit/public/toast/title_snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiSnackbar {
  /// 展示snackbar
  void show_simple_snackbar(
    String text, {
    BuildContext? context,
    Duration? duration,
    Color backgroundColor = Colors.black45,
    int? maxLines,
    TextOverflow? textOverflow,
    String? title,
    bool showCloseButton = false,
  }) {
    var b_context = context ?? Get.context!;
    ScaffoldMessenger.of(b_context).clearSnackBars();
    ScaffoldMessenger.of(b_context).showSnackBar(
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
