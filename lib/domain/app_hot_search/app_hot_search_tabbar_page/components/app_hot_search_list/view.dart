import 'package:auto_size_text/auto_size_text.dart';
import 'package:cw2bit/domain/app_hot_search/app_hot_search_tabbar_page/models/hot_search_model.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'logic.dart';

class AppHotSearchListComponent extends StatelessWidget {
  AppHotSearchListComponent({Key? key}) : super(key: key);

  final logic = Get.put(AppHotSearchListLogic());
  final state = Get.find<AppHotSearchListLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              /// 历史归档点击
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 4, 5, 0),
                    child: Icon(
                      Icons.archive_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 18,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      '历史归档',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: Text(
                        '2023.09~至今',
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      // 1b-Trending
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 2, 3, 0),
                            child: Icon(
                              Icons.auto_awesome_rounded,
                              color: Color(0xFFFFE117),
                              size: 18,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                              child: Text(
                                '1b-Trending',
                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                              ),
                            ),
                          ),
                        ].addToEnd(SizedBox(width: 5)),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      // 1b-Discover
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 2, 3, 0),
                            child: Icon(
                              Icons.auto_awesome_rounded,
                              color: Color(0xFFFFE117),
                              size: 18,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                              child: Text(
                                '1b-Discover',
                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                              ),
                            ),
                          ),
                        ].addToEnd(SizedBox(width: 5)),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      // 1b-Tracking
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 2, 3, 0),
                            child: Icon(
                              Icons.auto_awesome_rounded,
                              color: Color(0xFFFFE117),
                              size: 18,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                              child: Text(
                                '1b-Tracking',
                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                              ),
                            ),
                          ),
                        ].addToEnd(SizedBox(width: 5)),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 8)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 2, 5, 0),
                      child: Icon(
                        Icons.local_fire_department_rounded,
                        color: Color(0xFFF95232),
                        size: 18,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                      child: Text(
                        '实时热搜',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                    Text(
                      '(小时更新，1b-Trending)',
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                  child: InkWell(
                    onTap: () => logic.fetch_app_hot_search_list(),
                    child: SizedBox(
                      height: 18,
                      width: 18,
                      child: Center(
                        child: GetBuilder<AppHotSearchListLogic>(
                          id: logic.k_app_hot_search_progress_indicator_view_id,
                          builder: (controller) {
                            return logic.m_fetching_hot_search
                                ? SizedBox(
                                    height: 10,
                                    width: 10,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context).primary,
                                      backgroundColor: Colors.transparent,
                                      strokeWidth: 3.0,
                                    ),
                                  )
                                : Icon(
                                    Icons.refresh_rounded,
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    size: 24,
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
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: GetBuilder<AppHotSearchListLogic>(
                id: logic.k_app_hot_search_view_id,
                builder: (controller) {
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: state.hot_search_list.isEmpty
                        ? Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 20, 8, 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '暂无数据...',
                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                      ),
                                ),
                                Text(
                                  '可能正在刷新...',
                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                      ),
                                )
                              ],
                            ),
                          )
                        : ListView.separated(
                            itemBuilder: (context, index) =>
                                _hotSearch(context, logic.state.hot_search_list[index]),
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 6,
                            ),
                            itemCount: logic.state.hot_search_list.length,
                            padding: EdgeInsets.zero,
                          ),
                  );
                },
              ),
            ),
          ),
        ].divide(SizedBox(height: 7.5)),
      ),
    );
  }

  Widget _hotSearch(BuildContext context, HotSearchModel model) {
    if (1 == model.index) {
      return InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          // 点击
          await logic.open_hot_search_webview(model);
        },
        child: Material(
          color: Colors.transparent,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: 50,
              maxHeight: 60,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFFBFBFB),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 3, 5, 3),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (state.is_last_reading(model))
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 15, 0),
                    child: GradientText(
                      '1',
                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                            fontFamily: 'Roboto',
                            color: Color(0xFFDB5969),
                            fontSize: 26,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w900,
                          ),
                      colors: [Color(0xFFDB5969), Color(0xFFF5F5F5)],
                      gradientDirection: GradientDirection.ltr,
                      gradientType: GradientType.linear,
                    ),
                  ),
                  Expanded(
                    child: AutoSizeText(
                      model.content,
                      maxLines: 2,
                      minFontSize: 12,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else if (2 == model.index) {
      return InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          // 点击
          await logic.open_hot_search_webview(model);
        },
        child: Material(
          color: Colors.transparent,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: 50,
              maxHeight: 60,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFFBFBFB),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 3, 5, 3),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (state.is_last_reading(model))
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 15, 0),
                    child: GradientText(
                      '2',
                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                            fontFamily: 'Roboto',
                            color: Color(0xFFDB5969),
                            fontSize: 22,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w900,
                          ),
                      colors: [FlutterFlowTheme.of(context).primary, Color(0xFFF5F5F5)],
                      gradientDirection: GradientDirection.ltr,
                      gradientType: GradientType.linear,
                    ),
                  ),
                  Expanded(
                    child: AutoSizeText(
                      model.content,
                      maxLines: 2,
                      minFontSize: 12,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else if (3 == model.index) {
      return InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          // 点击
          await logic.open_hot_search_webview(model);
        },
        child: Material(
          color: Colors.transparent,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: 50,
              maxHeight: 60,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFFBFBFB),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 3, 5, 3),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (state.is_last_reading(model))
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 15, 0),
                    child: GradientText(
                      '3',
                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                            fontFamily: 'Roboto',
                            color: Color(0xFFB24452),
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w900,
                          ),
                      colors: [Color(0xFFEE8C61), Color(0xFFF5F5F5)],
                      gradientDirection: GradientDirection.ltr,
                      gradientType: GradientType.linear,
                    ),
                  ),
                  Expanded(
                    child: AutoSizeText(
                      model.content,
                      maxLines: 2,
                      minFontSize: 12,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          // 点击
          await logic.open_hot_search_webview(model);
        },
        child: Material(
          color: Colors.transparent,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: 50,
              maxHeight: 60,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFFBFBFB),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 3, 5, 3),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (state.is_last_reading(model))
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 15, 0),
                    child: GradientText(
                      model.index.toString(),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFFFEA443),
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                          ),
                      colors: [Color(0xFFFEA443), Color(0xFFF5F5F5)],
                      gradientDirection: GradientDirection.ltr,
                      gradientType: GradientType.linear,
                    ),
                  ),
                  Expanded(
                    child: AutoSizeText(
                      model.content,
                      maxLines: 2,
                      minFontSize: 12,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
