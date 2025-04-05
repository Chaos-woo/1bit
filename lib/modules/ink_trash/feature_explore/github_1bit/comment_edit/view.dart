import 'package:cw2bit/modules/feature_explore/github_1bit/issues_detail/widgets/issues_detail_widget.dart';
import 'package:cw2bit/modules/feature_explore/github_1bit/values/constant.dart';
import 'package:cw2bit/infrastructure/ext/icon_extension.dart';
import 'package:cw2bit/modules/c_module_theme/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui0_.dart';
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
        leading:
            ui0_.icons.arrow_back.flow_appbar_back_button(back_result: GithubApiDataPostAction.no_action_then_back),
        actions: [],
        flexibleSpace: ui0_.appbar.bing_image_appbar_flexible_space(
          title: '编辑issues评论',
          icon: Icons.post_add_rounded,
          center_title: false,
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
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
                    hintText: '评论内容',
                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                          letterSpacing: 0,
                        ),
                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
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
                        letterSpacing: 0,
                      ),
                  maxLines: 300,
                  minLines: 3,
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
                                  q0_.ui.toast.show('提交成功');
                                  q0_.route.back(back_result: GithubApiDataPostAction.posted_data_then_back);
                                } else {
                                  q0_.ui.toast.show('提交失败');
                                }
                              },
                              text: '提交',
                              options: FFButtonOptions(
                                height: 40,
                                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
      ),
    );
  }
}
