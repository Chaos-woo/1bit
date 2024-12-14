import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:qkit/qkit.dart';

class SnackbarWidget extends StatelessWidget {
  final String text;
  Color? background_color;
  int? max_lines;
  TextOverflow? text_over_flow;
  bool? show_close_button;

  SnackbarWidget(
    this.text, {
    super.key,
    this.background_color,
    this.max_lines,
    this.text_over_flow,
    this.show_close_button,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: q0_.bridge.flustars.screen.screenWidthExt * 0.95,
      decoration: BoxDecoration(
        color: background_color ?? FlutterFlowTheme.of(context).tertiary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    maxLines: max_lines ?? 4,
                    overflow: text_over_flow ?? TextOverflow.ellipsis,
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          color: Color(0xD8FFFFFF),
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            if (show_close_button ?? true)
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20,
                borderWidth: 1,
                buttonSize: 40,
                hoverColor: Color(0xFFF1F4F8),
                icon: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                },
              ),
          ].divide(SizedBox(width: 8)),
        ),
      ),
    );
  }
}
