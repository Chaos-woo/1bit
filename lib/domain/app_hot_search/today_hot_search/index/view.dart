import 'package:auto_size_text/auto_size_text.dart';
import 'package:cw2bit/domain/app_hot_search/values/constant.dart';
import 'package:cw2bit/infrastructure/router/router.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'logic.dart';

class TodayHotSearchPage extends StatelessWidget {
  TodayHotSearchPage({Key? key}) : super(key: key);

  final logic = Get.put(TodayHotSearchLogic());
  final state = Get.find<TodayHotSearchLogic>().state;

  final app_group_scroll_view_key = GlobalKey();
  final app_scroll_view_key = GlobalKey();
  final hot_search_scroll_view_key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '数据源：$c_hot_search_repo（Github）',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontSize: 13,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Expanded(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          /// 跳转设置页
                          await QKit.route.to(rt_news_apphotsearch_settings_home);
                        },
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(1, 0),
                            child: Icon(
                              Icons.settings,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 135,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: GetBuilder<TodayHotSearchLogic>(
                          id: logic.k_group_scroll_view_view_id,
                          builder: (_) {
                            return SingleChildScrollView(
                              key: app_group_scroll_view_key,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '组',
                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    onTap: () async {
                                      await logic.m_refresh_group_apps_and_hot_search_list();
                                    },
                                  ),
                                  for (var group in state.favorite_app_groups)
                                    InkWell(
                                      onTap: () async {
                                        /// 切换组
                                        await logic.switch_favorite_group_noUi(group.id!);
                                        logic.update([
                                          logic.k_group_scroll_view_view_id,
                                          logic.k_app_scroll_view_view_id,
                                          logic.k_hot_search_scroll_view_view_id,
                                        ]);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: state.group_id == group.id
                                              ? FlutterFlowTheme.of(context).secondary
                                              : FlutterFlowTheme.of(context).primaryBackground,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(2, 4, 2, 4),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                group.name,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      color: state.group_id == group.id
                                                          ? Colors.white
                                                          : FlutterFlowTheme.of(context).primaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                                overflow: TextOverflow.clip,
                                                maxLines: 1,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                ]
                                    .divide(SizedBox(height: 5))
                                    .addToStart(SizedBox(height: 5))
                                    .addToEnd(SizedBox(height: 5)),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: GetBuilder<TodayHotSearchLogic>(
                          id: logic.k_app_scroll_view_view_id,
                          builder: (_) {
                            return SingleChildScrollView(
                              key: app_scroll_view_key,
                              child: GetBuilder<TodayHotSearchLogic>(
                                builder: (_) {
                                  var apps = state.favorite_apps_by_group_id(state.group_id);
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Wrap(
                                        spacing: 5,
                                        runSpacing: 5,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment: WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection: VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          for (var app in apps)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onTap: () async {
                                                /// 切换app，刷新热搜列表
                                                await logic.fetch_app_hot_search_list_noUi(app).throttleWithTimeout(
                                                    timeout_mill: 3000,
                                                    onCompleted: (_) {
                                                      logic.update([
                                                        logic.k_app_scroll_view_view_id,
                                                        logic.k_hot_search_scroll_view_view_id,
                                                      ]);
                                                      QKit.ui.toast.show('获取热搜完成');
                                                    },
                                                    onError: (error) {
                                                      QKit.ui.toast.show('获取热搜失败');
                                                    });
                                              },
                                              child: app.name == state.app
                                                  ? Container(
                                                      height: 28,
                                                      constraints: BoxConstraints(
                                                        minWidth: 65,
                                                        maxWidth: 150,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme.of(context).primary,
                                                        borderRadius: BorderRadius.circular(4),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              app.name,
                                                              textAlign: TextAlign.justify,
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                    color: Colors.white,
                                                                    letterSpacing: 0.0,
                                                                  ),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      height: 28,
                                                      constraints: BoxConstraints(
                                                        minWidth: 65,
                                                        maxWidth: 150,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                        borderRadius: BorderRadius.circular(4),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              app.name,
                                                              textAlign: TextAlign.justify,
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                    letterSpacing: 0.0,
                                                                  ),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
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
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Text(
                      '(小时更新)',
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                  child: GetBuilder<TodayHotSearchLogic>(
                      id: logic.k_hot_search_refresh_view_id,
                      builder: (_) {
                        return logic.hot_search_refreshing
                            ? const SizedBox(
                                height: 14,
                                width: 14,
                                child: Center(child: CircularProgressIndicator()),
                              )
                            : Icon(
                                Icons.refresh_rounded,
                                color: FlutterFlowTheme.of(context).secondaryText,
                                size: 24,
                              );
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: GetBuilder<TodayHotSearchLogic>(
                    id: logic.k_hot_search_scroll_view_view_id,
                    builder: (_) {
                      return ListView.separated(
                        key: hot_search_scroll_view_key,
                        itemCount: state.hot_search_list.length,
                        itemBuilder: (context, index) {
                          var hot_search = state.hot_search_list[index];
                          var (be_raed, remaining) = logic.get_app_progress_ratio(hot_search.url);
                          var seq_font_color = Color(0xFFFEA443);
                          var seq_font_size = 12;
                          switch (hot_search.index) {
                            case 1:
                              seq_font_color = Color(0xFFDB5969);
                              seq_font_size = 18;
                              break;
                            case 2:
                              seq_font_color = Color(0xFF4B39EF);
                              seq_font_size = 16;
                              break;
                            case 3:
                              seq_font_color = Color(0xFFEE8C61);
                              seq_font_size = 14;
                              break;
                            default:
                              break;
                          }
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              /// 打开webview浏览器
                              await logic.open_hot_search_webview(hot_search);
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                width: double.infinity,
                                constraints: BoxConstraints(
                                  minHeight: 50,
                                  maxHeight: 50,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFBFBFB),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Stack(
                                  alignment: AlignmentDirectional(0, 0),
                                  children: [
                                    if (be_raed > 0 && remaining > 0)
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: be_raed,
                                            child: Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Color(0x4D39D2C0),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(8),
                                                  bottomRight: Radius.circular(0),
                                                  topLeft: Radius.circular(8),
                                                  topRight: Radius.circular(0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: remaining,
                                            child: Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFECECEC),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(0),
                                                  bottomRight: Radius.circular(8),
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(5, 3, 5, 3),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 15, 0),
                                            child: GradientText(
                                              '${hot_search.index}',
                                              style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                    color: Color(0xFFDB5969),
                                                    fontSize: seq_font_size.toDouble(),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                              colors: [seq_font_color, Color(0xFFF5F5F5)],
                                              gradientDirection: GradientDirection.ltr,
                                              gradientType: GradientType.linear,
                                            ),
                                          ),
                                          Expanded(
                                            child: AutoSizeText(
                                              hot_search.content,
                                              maxLines: 2,
                                              minFontSize: 12,
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    letterSpacing: 0.0,
                                                  ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          if (be_raed == 100) ...[
                                            AutoSizeText(
                                              '已阅读完成',
                                              maxLines: 1,
                                              minFontSize: 12,
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    letterSpacing: 0.0,
                                                    decoration: TextDecoration.underline,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(5, 4, 5, 0),
                                              child: Container(
                                                width: 5,
                                                height: 5,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(context).success,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          String? last_read_url = logic.get_last_read_url();

                          // 判断是否是最后一个分隔符的位置
                          var is_last_separator_pos =
                              (index + 1) == state.hot_search_list.lastIndexOf(state.hot_search_list.last);

                          if (is_last_separator_pos) {
                            // 最后一个分隔符位置的话，需要判断是向上指还是向下指
                            if (last_read_url == state.hot_search_list[index].url) {
                              var (be_raed, _) = logic.get_app_progress_ratio(state.hot_search_list[index].url);
                              if (be_raed > 0) {
                                return Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(5, 2, 0, 0),
                                    child: Text(
                                      '👆👆👆最后阅读：$be_raed%',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            color: FlutterFlowTheme.of(context).secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                );
                              } else {
                                return SizedBox(
                                  height: 8,
                                );
                              }
                            } else if (last_read_url == state.hot_search_list.last.url) {
                              var (be_raed, _) = logic.get_app_progress_ratio(state.hot_search_list.last.url);
                              if (be_raed > 0) {
                                return Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(5, 2, 0, 0),
                                    child: Text(
                                      '👇👇👇最后阅读：$be_raed%',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            color: FlutterFlowTheme.of(context).secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                );
                              } else {
                                return SizedBox(
                                  height: 8,
                                );
                              }
                            } else {
                              return SizedBox(
                                height: 8,
                              );
                            }
                          } else {
                            // 其他位置为通用位置，全部向上指
                            var (be_raed, _) = logic.get_app_progress_ratio(state.hot_search_list[index].url);
                            if (last_read_url == state.hot_search_list[index].url && be_raed > 0) {
                              return Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(5, 2, 0, 0),
                                  child: Text(
                                    '👆👆👆最后阅读：$be_raed%',
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          color: FlutterFlowTheme.of(context).secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              );
                            } else {
                              return SizedBox(
                                height: 8,
                              );
                            }
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
