import 'package:cw2bit/modules/b_dependency/DPs.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

extension IconExtension on Icon {
  Icon copyWith({
    Key? key,
    Color? color,
    String? semanticLabel,
    TextDirection? textDirection,
    double? size,
  }) {
    return Icon(
      icon,
      key: key ?? this.key,
      color: color ?? this.color,
      semanticLabel: semanticLabel ?? this.semanticLabel,
      textDirection: this.textDirection,
      size: size ?? this.size,
      fill: fill,
      weight: weight,
      grade: grade,
      opticalSize: opticalSize,
      shadows: shadows,
      applyTextScaling: applyTextScaling,
    );
  }

  Widget get themeAware => DPs.theme.isDarkMode ? copyWith(color: Colors.white) : copyWith(color: Colors.black);
}

extension IconDataExtension on IconData {
  Icon toIcon({double? size, Color? color}) {
    return Icon(this, size: size, color: color);
  }

  Widget themeAwareAndSize(double size) {
    return Icon(this, size: size).themeAware;
  }
}
