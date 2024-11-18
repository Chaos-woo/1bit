import 'package:cw2bit/domain/tool/github_1bit/issues_detail/widgets/issues_comment_widget.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues_detail/widgets/issues_detail_widget.dart';
import 'package:cw2bit/domain/tool/github_1bit/values/constant.dart';
import 'package:cw2bit/infrastructure/router/router.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui0_.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class Github1bitIssuesDetailPage extends StatelessWidget {
  const Github1bitIssuesDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(Github1bitIssuesDetailLogic());
    final state = Get.find<Github1bitIssuesDetailLogic>().state;

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          GithubApiDataPostAction postResult = await q0_.route.to(
            rout0_.tool_github_comment_edit,
            argument: state.issues_model,
          ) as GithubApiDataPostAction;
          if (postResult == GithubApiDataPostAction.posted_data_then_back) {
            logic.request_refresh();
          }
        },
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.of(context).info,
          size: 24,
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
            q0_.route.back();
          },
        ),
        flexibleSpace: ui0_.appbar.bing_image_appbar_flexible_space(
          title: '1ssues',
          icon: Icons.quiz_rounded,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              IssuesDetailCompWidget(issues: state.issues_model),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 5, 0),
                      child: Icon(
                        Icons.commit_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 14,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Text(
                        '讨论列表',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).labelMedium.override(
                              fontSize: 14,
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: PagingWidgetBuilder.build_refresher(
                    logic,
                    builder: (controller) {
                      return ListView.builder(
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.5),
                          child: IssuesCommentCompWidget(comment: state.data_list[index]),
                        ),
                        itemCount: state.data_list.length,
                        physics: BouncingScrollPhysics(),
                        addAutomaticKeepAlives: true,
                      );
                    },
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
