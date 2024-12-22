import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

class UiButton {
  Widget plant_button(
    String text, {
    Function()? on_tap,
    Color color = Colors.white,
  }) {
    return FFButtonWidget(
      onPressed: on_tap,
      text: text,
      options: FFButtonOptions(
        height: 30,
        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        color: color,
        textStyle: FlutterFlowTheme.of_none_context().bodyMedium.override(
              color: color == Colors.white ? Color(0xFF15161E) : Colors.white,
              fontSize: 14,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
            ),
        elevation: 0,
        borderSide: BorderSide(
          color: Color(0xFFE5E7EB),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
        hoverColor: Color(0xFFE5E7EB),
        hoverBorderSide: BorderSide(
          color: Color(0xFFE5E7EB),
          width: 1,
        ),
        hoverTextColor: Color(0xFF15161E),
        hoverElevation: 0,
      ),
    );
  }
}
