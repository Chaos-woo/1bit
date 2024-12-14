import 'package:cw2bit/infrastructure/database/entity/tag/sticker.dart';
import 'package:cw2bit/infrastructure/ext/string_ext.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiSticker {
  Widget small_sticker(Sticker sticker, {Function()? on_tap}) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: on_tap,
      child: Container(
        decoration: BoxDecoration(
          color: sticker.color.to_color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(3, 1, 3, 1),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                child: Icon(
                  '#' == sticker.sign ? Icons.tag_rounded : Icons.alternate_email_rounded,
                  color: FlutterFlowTheme.of(Get.context!).secondary,
                  size: 12,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                child: Text(
                  sticker.name,
                  style: FlutterFlowTheme.of(Get.context!).labelSmall.override(
                        color: sticker.font_color.to_color,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
