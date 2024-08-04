import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_issues/models/issues/issues_model.dart';
import 'package:cw2bit/domain/tool/github_1bit/values/constant.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class GithubIssuesWidget extends StatelessWidget {
  final IssuesModel issues;

  const GithubIssuesWidget({Key? key, required this.issues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(GithubIssuesLogic());
    final state = Get.find<GithubIssuesLogic>().state;

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                            ? Color(0xFFFF0000)
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
                      ),
                      showLoadingIndicator: false,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${issues.user.login} 创建',
                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                fontSize: 12,
                                letterSpacing: 0,
                              ),
                        ),
                        Text(
                          QKit.bridge.flustars.date.formatDate(
                            issues.createdAt,
                            format: c_issues_date_time_format,
                          ),
                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                fontSize: 12,
                                letterSpacing: 0,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Bit1Ui.expandableText(
                          issues.title,
                          maxLines: 3,
                          textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                letterSpacing: 0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        '${issues.comments} · 评论',
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            issues.labels.map((e) => e.name).toList().join(', '),
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                  letterSpacing: 0,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ].divide(SizedBox(height: 3)),
          ),
        ),
      ),
    );
  }
}
