import 'package:auto_size_text/auto_size_text.dart';
import 'package:cw2bit/domain/app_hot_search/app_hot_search_tabbar_page/components/app_hot_search_list/view.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AppHotSearchTabbarPagePage extends StatelessWidget {
  AppHotSearchTabbarPagePage({Key? key}) : super(key: key);

  final logic = Get.put(AppHotSearchTabbarPageLogic());
  final state = Get.find<AppHotSearchTabbarPageLogic>().state;

  var app_scroll_view_key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 100,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(3, 0, 3, 0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      /// 设置
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 40,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.cookie,
                                            color: FlutterFlowTheme.of(context).secondaryText,
                                            size: 18,
                                          ),
                                          Text(
                                            '设置',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 3)),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      /// 排序
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 40,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.sort_rounded,
                                            color: FlutterFlowTheme.of(context).secondaryText,
                                            size: 18,
                                          ),
                                          Text(
                                            '排序',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 3)),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      /// 收藏
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 40,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star_rounded,
                                            color: FlutterFlowTheme.of(context).secondaryText,
                                            size: 18,
                                          ),
                                          Text(
                                            '收藏',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 3)),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 4)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Container(
                            width: 100,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                              child: GetBuilder<AppHotSearchTabbarPageLogic>(
                                id: logic.k_app_scroll_view_view_id,
                                builder: (controller) {
                                  return SingleChildScrollView(
                                    key: app_scroll_view_key,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        for (var app in state.apps)
                                          if (state.app == app)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onTap: () async {
                                                /// 切换APP
                                                logic.update_select_app(app);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                                  borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(8),
                                                    bottomRight: Radius.circular(0),
                                                    topLeft: Radius.circular(8),
                                                    topRight: Radius.circular(0),
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment: AlignmentDirectional(0, 0),
                                                  child: AutoSizeText(
                                                    app,
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    minFontSize: 10,
                                                    style: FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Readex Pro',
                                                          color:
                                                              FlutterFlowTheme.of(context).primary,
                                                          letterSpacing: 0,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            )
                                          else
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 3, 0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor: Colors.transparent,
                                                onTap: () async {
                                                  /// 切换APP
                                                  logic.update_select_app(app);
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 40,
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment: AlignmentDirectional(0, 0),
                                                    child: AutoSizeText(
                                                      app,
                                                      textAlign: TextAlign.center,
                                                      maxLines: 1,
                                                      minFontSize: 10,
                                                      style: FlutterFlowTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Readex Pro',
                                                            letterSpacing: 0,
                                                          ),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                      ]
                                          .addToStart(SizedBox(height: 10))
                                          .addToEnd(SizedBox(height: 10)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: AppHotSearchListComponent(),
                ),
              ].divide(SizedBox(width: 10)),
            ),
          ),
        ),
      ],
    );
  }
}
