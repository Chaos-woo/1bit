import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:cw2bit/infra/a_sdk_bridge/text_util_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final class INKSnackBar {
  static void show(
    String text, {
    BuildContext? context,
    Duration? stayDuration,
    String? actionLabel,
    Color? actionColor,
    Function()? actionOnTap,
  }) {
    ScaffoldMessenger.maybeOf(context ?? Get.context!)?.showSnackBar(
      SnackBar(
        content: Text(
          text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        duration: stayDuration ?? 4.seconds,
        action: INKs.sdk.text.isNotEmpty(actionLabel)
            ? SnackBarAction(
                label: actionLabel!,
                textColor: actionColor,
                onPressed: () {
                  actionOnTap?.call();
                },
              )
            : null,
      ),
    );
  }

  static void clearAll(BuildContext? context) {
    ScaffoldMessenger.maybeOf(context ?? Get.context!)?.clearSnackBars();
  }
}
