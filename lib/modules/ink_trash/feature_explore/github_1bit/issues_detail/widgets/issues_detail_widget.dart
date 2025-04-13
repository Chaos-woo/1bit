import 'package:cw2bit/modules/feature_explore/github_1bit/issues/components/github_issues/models/issues/issues_model.dart';
import 'package:cw2bit/modules/feature_explore/github_1bit/values/constant.dart';
import 'package:cw2bit/infrastructure/ext/string_ext.dart';
import 'package:cw2bit/modules/c_module_app_theme/provider/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui0_.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

class IssuesDetailCompWidget extends StatelessWidget {
  final IssuesModel issues;

  const IssuesDetailCompWidget({super.key, required this.issues});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 350),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
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
                            q0_.bridge.flustars.date.format_date(
                              issues.createdAt,
                              format: c_issues_date_time_format,
                            ),
                            style:
                                FlutterFlowTheme.of(context).labelSmall.override(letterSpacing: 0, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        // do something
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
                        child: ui0_.functionality.expandableText(
                          '${issues.title}',
                          max_lines: 2,
                          text_style: FlutterFlowTheme.of(context).bodyLarge.override(
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
                        child: ui0_.functionality.expandableText(
                          issues.body ?? '',
                          max_lines: 15,
                          text_style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                          // do something
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
                          color: label.color.to_color,
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
        ),
      ),
    );
  }
}
