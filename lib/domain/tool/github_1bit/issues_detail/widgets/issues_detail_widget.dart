import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_issues/models/issues/issues_model.dart';
import 'package:cw2bit/domain/tool/github_1bit/values/constant.dart';
import 'package:cw2bit/infrastructure/ext/string_ext.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

class IssuesDetailCompWidget extends StatelessWidget {
  final IssuesModel issues;

  const IssuesDetailCompWidget({super.key, required this.issues});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      issues.user.login,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            letterSpacing: 0,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        QKit.bridge.flustars.date.formatDate(
                          issues.createdAt,
                          format: c_issues_date_time_format,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .labelSmall
                            .override(letterSpacing: 0, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: issues.state.capitalize!,
                  icon: Icon(
                    Icons.pending_actions,
                    color: Colors.white,
                    size: 10,
                  ),
                  options: FFButtonOptions(
                      height: 20,
                      padding: EdgeInsetsDirectional.fromSTEB(3, 0, 3, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: c_issues_state_open.isCaseInsensitiveContains(issues.state)
                          ? Color(0xFFFF5353)
                          : Colors.blue,
                      textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                            color: Colors.white,
                            fontSize: 12,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w300,
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(3),
                      elevation: 0.0),
                  showLoadingIndicator: false,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Bit1Ui.expandableText(
                      '${issues.title}',
                      maxLines: 2,
                      textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Bit1Ui.expandableText(
                      '${issues.body}',
                      maxLines: 15,
                      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                            letterSpacing: 0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                for (var label in issues.labels)
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: label.name,
                    icon: Icon(
                      Icons.tag_rounded,
                      color: Colors.white,
                      size: 10,
                    ),
                    options: FFButtonOptions(
                      height: 20,
                      padding: EdgeInsetsDirectional.fromSTEB(3, 0, 3, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: label.color.toColor,
                      textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                            color: Colors.white,
                            fontSize: 12,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w300,
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      elevation: 0,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    showLoadingIndicator: false,
                  ),
              ].divide(SizedBox(width: 5)),
            ),
          ],
        ),
      ),
    );
  }
}
