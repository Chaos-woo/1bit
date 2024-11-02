import 'package:auto_size_text/auto_size_text.dart';
import 'package:cw2bit/domain/app_hot_search/values/constant.dart';
import 'package:cw2bit/infrastructure/api/github/models/github_enum.dart';
import 'package:cw2bit/infrastructure/ext/string_ext.dart';
import 'package:cw2bit/infrastructure/router/router.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'logic.dart';

class HistoryHotSearchPage extends StatelessWidget {
  HistoryHotSearchPage({Key? key}) : super(key: key);

  final logic = Get.put(HistoryHotSearchLogic());
  final state = Get.find<HistoryHotSearchLogic>().state;

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
            height: 120,
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
                      child: GetBuilder<HistoryHotSearchLogic>(
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
                      child: GetBuilder<HistoryHotSearchLogic>(
                          id: logic.k_app_scroll_view_view_id,
                          builder: (_) {
                            return SingleChildScrollView(
                              key: app_scroll_view_key,
                              child: GetBuilder<HistoryHotSearchLogic>(
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
                                                /// 切换app，刷新历史文档列表，清空热搜列表
                                                await logic
                                                    .fetch_next_dir_list_noUi(
                                                      '${c_hot_search_repo_root_dir}/${app.name}',
                                                      app_name: app.name,
                                                    )
                                                    .throttleWithTimeout(
                                                        timeout_mill: 3000,
                                                        onCompleted: (_) {
                                                          logic.update([
                                                            logic.k_app_scroll_view_view_id,
                                                            logic.k_hot_search_scroll_view_view_id,
                                                            logic.k_app_hot_search_history_directory_view_id
                                                          ]);
                                                          QKit.ui.toast.show('获取归档完成');
                                                        },
                                                        onError: (error) {
                                                          QKit.ui.toast.show('获取归档失败');
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
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
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
                        '历史热搜',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: Text(
                      '2023.09 ~ 至今',
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await R1Ui.dialog.show_custom_dialog_with_ok_cancel_buttons(
                      children: [
                        FlutterFlowCalendar(
                          initialDate: DateTime.now(),
                          color: FlutterFlowTheme.of(context).primary,
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          weekFormat: false,
                          weekStartsMonday: true,
                          onChange: (DateTimeRange? newSelectedDate) {
                            if (newSelectedDate != null) {
                              state.picked_date = newSelectedDate.start;
                            }
                          },
                          titleStyle: FlutterFlowTheme.of(context).labelSmall.override(letterSpacing: 0.0),
                          dayOfWeekStyle: FlutterFlowTheme.of(context).labelSmall.override(letterSpacing: 0.0),
                          dateStyle: FlutterFlowTheme.of(context).bodySmall.override(letterSpacing: 0.0),
                          selectedDateStyle: FlutterFlowTheme.of(context).titleSmall.override(letterSpacing: 0.0),
                          inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium.override(letterSpacing: 0.0),
                        ),
                      ],
                      title: '直达【${state.app}】指定日期热搜',
                      confirm_text: '确定',
                      cancel_text: '取消',
                      on_confirm: () async {
                        if (state.app.isEmpty) {
                          QKit.ui.toast.show('请先选择APP');
                          return;
                        }

                        /// 选择时间后，直接切换到指定的历史归档
                        var year = state.picked_date.year;
                        var month = state.picked_date.month;
                        if (month < 10) {
                          month = int.parse('0$month');
                        }
                        var day = state.picked_date.day;
                        if (day < 10) {
                          day = int.parse('0$day');
                        }

                        if (state.picked_date.isAfter(DateTime.now())) {
                          QKit.ui.toast.show('未来的热搜还在生产哦~');
                          return;
                        }

                        if (QKit.bridge.flustars.date.isToday(state.picked_date.millisecondsSinceEpoch)) {
                          // 选择的是今天，直接获取当天热搜
                          var archive_dir_path = '$c_hot_search_repo_root_dir/${state.app}/$year/$month';
                          var archive_file_path =
                              '$c_hot_search_repo_root_dir/${state.app}/$year/$month/${state.app}.md';
                          await (Future.wait(
                            [
                              logic.fetch_app_hot_search_list_noUi(archive_file_path),
                              logic.fetch_next_dir_list_noUi(archive_dir_path)
                            ],
                          ).throttleWithTimeout(
                              timeout_mill: 3000,
                              onCompleted: (_) {
                                logic.update([
                                  logic.k_hot_search_scroll_view_view_id,
                                  logic.k_app_hot_search_history_directory_view_id
                                ]);
                              },
                              onError: (error) {
                                QKit.ui.toast.show('获取归档失败');
                              }));
                          return;
                        }

                        // 1.年份>=2024，使用yyyy/mm/yyyy-mm-dd.md格式的归档路径
                        // 2.年份>=2023 & 月份>=11月，使用yyyy/mm/yyyy-mm-dd.md格式的归档路径
                        // 3.年份>=2023 & 月份<8月，提示无归档数据
                        // 4.年份>=2023 & 月份<11月，使用yyyy/mm归档路径，仅跳转月份归档
                        // 5.年份 < 2023，提示无归档数据
                        // 6.报错时，提示跳转失败
                        var archive_dir_path = '';
                        var archive_file_path = '';
                        if (year >= 2024) {
                          archive_file_path =
                              '$c_hot_search_repo_root_dir/${state.app}/$year/$month/$year-$month-$day.md';
                          archive_dir_path = '$c_hot_search_repo_root_dir/${state.app}/$year/$month';
                        } else if (year >= 2023 && month >= 11) {
                          archive_file_path =
                              '$c_hot_search_repo_root_dir/${state.app}/$year/$month/$year-$month-$day.md';
                          archive_dir_path = '$c_hot_search_repo_root_dir/${state.app}/$year/$month';
                        } else if (year >= 2023 && month < 8) {
                          QKit.ui.toast.show('无归档数据');
                        } else if (year >= 2023 && month < 11) {
                          archive_dir_path = '$c_hot_search_repo_root_dir/${state.app}/$year/$month';
                        } else {
                          QKit.ui.toast.show('无归档数据');
                        }

                        print('archive_dir_path: $archive_dir_path ; archive_file_path: $archive_file_path');
                        await (Future.wait(
                          [
                            logic.fetch_app_hot_search_list_noUi(archive_file_path),
                            logic.fetch_next_dir_list_noUi(archive_dir_path)
                          ],
                        ).throttleWithTimeout(
                            timeout_mill: 3000,
                            onCompleted: (_) {
                              logic.update([
                                logic.k_hot_search_scroll_view_view_id,
                                logic.k_app_hot_search_history_directory_view_id
                              ]);
                            },
                            onError: (error) {
                              QKit.ui.toast.show('获取归档失败');
                            }));
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.calendar_month,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: GetBuilder<HistoryHotSearchLogic>(
                              id: logic.k_app_hot_search_history_directory_view_id,
                              builder: (_) {
                                return ListView.separated(
                                  itemCount: state.history_directory_list.length,
                                  itemBuilder: (context, index) {
                                    var content = state.history_directory_list[index];
                                    if (index == 0 && state.m_current_dir_path.split("/").length > 2) {
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          /// 跳转到上一页
                                          /// 计算当前路径的上一路径
                                          var parent_path_array = state.m_current_dir_path.split('/');
                                          var parent_path =
                                              parent_path_array.sublist(0, parent_path_array.length - 1).join('/');
                                          await logic.fetch_next_dir_list_noUi(parent_path).throttleWithTimeout(
                                              timeout_mill: 3000,
                                              onCompleted: (_) {
                                                logic.update([
                                                  logic.k_app_scroll_view_view_id,
                                                  logic.k_hot_search_scroll_view_view_id,
                                                  logic.k_app_hot_search_history_directory_view_id
                                                ]);
                                              },
                                              onError: (error) {
                                                QKit.ui.toast.show('获取内容列表失败');
                                              });
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(5, 4, 5, 0),
                                                child: Icon(
                                                  Icons.folder_copy_rounded,
                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                  size: 18,
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(-1, 0),
                                                child: Text(
                                                  '..',
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }

                                    if (EnumGithubContentType.dir == content.type) {
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          /// 跳转到下一文件夹
                                          await logic.fetch_next_dir_list_noUi(content.path).throttleWithTimeout(
                                              timeout_mill: 3000,
                                              onCompleted: (_) {
                                                logic.update([
                                                  logic.k_app_scroll_view_view_id,
                                                  logic.k_hot_search_scroll_view_view_id,
                                                  logic.k_app_hot_search_history_directory_view_id
                                                ]);
                                              },
                                              onError: (error) {
                                                QKit.ui.toast.show('获取内容列表失败');
                                              });
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(5, 4, 5, 2),
                                                child: Icon(
                                                  Icons.folder,
                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                  size: 14,
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment: AlignmentDirectional(-1, 0),
                                                  child: Text(
                                                    content.name,
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                          letterSpacing: 0.0,
                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    } else if (EnumGithubContentType.file == content.type) {
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          /// 刷新指定的热搜归档页
                                          await logic.fetch_app_hot_search_list_noUi(content.path).throttleWithTimeout(
                                              timeout_mill: 3000,
                                              onCompleted: (_) {
                                                logic.update([
                                                  logic.k_hot_search_scroll_view_view_id,
                                                  logic.k_app_hot_search_history_directory_view_id
                                                ]);
                                              },
                                              onError: (error) {
                                                QKit.ui.toast.show('获取热搜失败');
                                              });
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: state.m_is_current_file_specified(content.path)
                                                ? FlutterFlowTheme.of(context).secondary
                                                : FlutterFlowTheme.of(context).primaryBackground,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment: AlignmentDirectional(-1, 0),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 4),
                                                    child: AutoSizeText(
                                                      content.name,
                                                      maxLines: content.name
                                                              .replaceAll('.md', '')
                                                              .is_strict_date_time_format_YYYY_MM_DD()
                                                          ? 1
                                                          : 2,
                                                      minFontSize: 10,
                                                      maxFontSize: 14,
                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                            letterSpacing: 0.0,
                                                            color: state.m_is_current_file_specified(content.path)
                                                                ? Colors.white
                                                                : FlutterFlowTheme.of(context).secondaryText,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 4);
                                  },
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                );
                              }),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: GetBuilder<HistoryHotSearchLogic>(
                          id: logic.k_hot_search_scroll_view_view_id,
                          builder: (_) {
                            return ListView.separated(
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
                                          if (be_raed != -1 && remaining != -1)
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
                                                    minFontSize: 10,
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
                                if (last_read_url == state.hot_search_list[index].url) {
                                  var (be_raed, _) = logic.get_app_progress_ratio(state.hot_search_list[index].url);
                                  if (be_raed != -1) {
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
                                  }
                                }

                                return SizedBox(
                                  height: 8,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
