import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:qkit/qkit.dart';

class SnackbarWidget extends StatelessWidget {
  final String text;
  Color? backgroundColor;
  int? maxLines;
  TextOverflow? textOverflow;
  bool? showCloseButton;

  SnackbarWidget(
    this.text, {
    super.key,
    this.backgroundColor,
    this.maxLines,
    this.textOverflow,
    this.showCloseButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: QKit.bridge.flustars.screen.screenWidthExt * 0.95,
      decoration: BoxDecoration(
        color: backgroundColor ?? FlutterFlowTheme.of(context).tertiary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    maxLines: maxLines ?? 4,
                    overflow: textOverflow ?? TextOverflow.ellipsis,
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Figtree',
                          color: Color(0xD8FFFFFF),
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ].divide(SizedBox(height: 4)),
              ),
            ),
            if (showCloseButton ?? true)
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
