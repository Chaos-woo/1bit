import 'package:cw2bit/domain/tool/github_1bit/issues/values/github_api_handle.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues_detail/widgets/issues_detail_widget.dart';
import 'package:cw2bit/public/ui/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class Github1bitCommentEditPage extends StatelessWidget {
  const Github1bitCommentEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<Github1bitCommentEditLogic>();
    final state = Get.find<Github1bitCommentEditLogic>().state;

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            QKit.route.back(backValue: GithubPostResult.quitPage);
          },
        ),
        title: Text(
          '编辑 1bit issues 评论',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontSize: 22,
                letterSpacing: 0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(),
                child: IssuesDetailCompWidget(issues: state.issuesModel),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
              child: TextFormField(
                controller: logic.textController,
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: '评论内容',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                      ),
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0,
                    ),
                maxLines: 20,
                minLines: 1,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              var postResult = await logic.post();
                              if (postResult) {
                                Bit1Ui.showSnackBar('提交成功');
                                QKit.route.back(backValue: GithubPostResult.posted);
                              } else {
                                Bit1Ui.showSnackBar('提交失败');
                              }
                            },
                            text: '提交',
                            options: FFButtonOptions(
                              height: 40,
                              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
