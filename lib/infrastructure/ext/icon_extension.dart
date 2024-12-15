import 'package:cw2bit/domain/microsoft_bing/service/bing_mgr.dart';
import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:qkit/qkit.dart';

extension IconExtension on Icon {
  Icon copyWith({
    Key? key,
    Color? color,
    String? semantic_label,
    TextDirection? text_direction,
    double? size,
  }) {
    return Icon(
      this.icon,
      key: key ?? this.key,
      color: color ?? this.color,
      semanticLabel: semantic_label ?? this.semanticLabel,
      textDirection: this.textDirection,
      size: size ?? this.size,
      fill: this.fill,
      weight: this.weight,
      grade: this.grade,
      opticalSize: this.opticalSize,
      shadows: this.shadows,
      applyTextScaling: this.applyTextScaling,
    );
  }

  Widget get theme_aware =>
      c0_.mgr_theme.is_dark_theme ? this.copyWith(color: Colors.white) : this.copyWith(color: Colors.black);
}

extension IconDataExtension on IconData {
  Icon to_icon() {
    return Icon(this);
  }

  Widget theme_aware_with_size(double size) {
    return Icon(this, size: size).theme_aware;
  }

  Widget flow_appbar_action_button({EdgeInsetsGeometry? padding, double icon_size = 24, dynamic Function()? on_tap}) {
    return padding != null
        ? Padding(
            padding: padding,
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 25,
              buttonSize: 25,
              icon: Icon(this, size: icon_size, color: BingMgr.m_show_bing_daily_image ? Colors.white : Colors.black),
              onPressed: on_tap,
            ),
          )
        : Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 14),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 25,
              buttonSize: 25,
              icon: Icon(this, size: icon_size, color: BingMgr.m_show_bing_daily_image ? Colors.white : Colors.black),
              onPressed: on_tap,
            ),
          );
  }

  Widget flow_appbar_back_button({dynamic back_result}) {
    return this.flow_appbar_action_button(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      icon_size: 26,
      on_tap: () => q0_.route.back(back_result: back_result),
    );
  }

  Widget ink_button({
    double size = 24,
    Color? color,
    dynamic Function()? on_tap,
    dynamic Function()? on_long_press,
  }) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: on_tap,
      onLongPress: on_long_press,
      child: Icon(
        this,
        color: color,
        size: size,
      ),
    );
  }
}
