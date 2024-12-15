import 'package:auto_size_text/auto_size_text.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cw2bit/domain/app_hot_search/service/hot_search_mgr.dart';
import 'package:cw2bit/domain/github/models/github_repo.dart';
import 'package:cw2bit/infrastructure/api/github/models/github_enum.dart';
import 'package:cw2bit/infrastructure/ext/icon_extension.dart';
import 'package:cw2bit/infrastructure/ext/string_ext.dart';
import 'package:cw2bit/infrastructure/router/rt0_.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui0_.dart';
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
          Container(
            width: double.infinity,
            height: 135,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ui0_.icons.setting.ink_button(
                          on_tap: () async {
                            /// 跳转设置页
                            await rout0_.app_hot_search_settings_home.to_then_back();
                          },
                        ).paddingSymmetric(horizontal: 12),
                        GetBuilder<HistoryHotSearchLogic>(
                          id: logic.k_hot_search_repo_view_id,
                          builder: (_) {
                            return (GithubRepo.riibit == state.repo ? Icons.looks_one_rounded : Icons.looks_two_rounded)
                                .ink_button(
                              on_tap: () async {
                                /// 切换热搜仓库
                                q0_.ui.loading.show(loading_tip: '热搜仓库切换中...');
                                await logic.switch_hot_search_repo_noUi(
                                  GithubRepo.riibit == state.repo
                                      ? GithubRepo.hot_searches_for_apps
                                      : GithubRepo.riibit,
                                );
                                q0_.ui.loading.dismiss(dismiss_tip: '热搜仓库切换完成');
                              },
                              on_long_press: () async {
                                /// 长按解释设置原因
                                await ui0_.dialog.show_custom_dialog_with_ok_cancel_buttons(
                                  title: '为什么要切换热搜仓库？',
                                  on_confirm: () {},
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text('历史热搜信息包含信息采集的APP和对应APP的热搜信息。'
                                                    '仅根据选择日期无法适配所有情况，所以要求用户使用切换按钮选择对应的仓库。默认仓库为热搜仓库1。'),
                                              )
                                            ],
                                          ).paddingSymmetric(vertical: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Icon(Icons.looks_one_rounded),
                                              Expanded(
                                                child: Text(' - 热搜仓库1：Chaos-woo/riibit，自定义新仓库。'),
                                              ),
                                            ],
                                          ).paddingSymmetric(vertical: 8),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Icon(Icons.looks_two_rounded),
                                              Expanded(
                                                child: Text(
                                                  ' - 热搜仓库2：WShuai123/hot_searches_for_apps，老仓库信息。',
                                                ),
                                              ),
                                            ],
                                          ).paddingSymmetric(vertical: 5),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              },
                            ).paddingSymmetric(horizontal: 12);
                          },
                        ),
                      ].divide(SizedBox(height: 10)).addToStart(SizedBox(height: 8)).addToEnd(SizedBox(height: 8)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
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
                                                  '分组',
                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            onTap: () async {
                                              await logic.m_refresh_group_apps_and_hot_search_list();
                                              q0_.ui.toast.show('刷新完成');
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
                                                              '${HotSearchMgr.root_dir}/${app.name}',
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
                                                                  q0_.ui.toast.show('获取归档完成');
                                                                },
                                                                onError: (error) {
                                                                  q0_.ui.toast.show('获取归档失败');
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
                                                                      style: FlutterFlowTheme.of(context)
                                                                          .bodySmall
                                                                          .override(
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
                                                                      style: FlutterFlowTheme.of(context)
                                                                          .bodySmall
                                                                          .override(
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
                )
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
                GetBuilder<HistoryHotSearchLogic>(
                    id: logic.k_app_scroll_view_view_id,
                    builder: (_) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: state.app.isEmpty
                            ? () async {
                                q0_.ui.toast.show('请先选择APP');
                              }
                            : () async {
                                await ui0_.dialog.show_custom_dialog_with_ok_cancel_buttons(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('日期＋下划线（例如 ', style: FlutterFlowTheme.of(context).labelSmall),
                                          Text(
                                            '10',
                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                  fontWeight: FontWeight.bold,
                                                  decoration: TextDecoration.underline,
                                                  decorationThickness: 5,
                                                  decorationColor: FlutterFlowTheme.of(context).secondary,
                                                ),
                                          ),
                                          Text(' ）表示10号当日存在热搜。', style: FlutterFlowTheme.of(context).labelSmall),
                                        ],
                                      ),
                                    ),
                                    CalendarDatePicker2(
                                      key: logic.calendar_key,
                                      config: CalendarDatePicker2Config(
                                        calendarViewMode: CalendarDatePicker2Mode.day,
                                        calendarType: CalendarDatePicker2Type.single,
                                        selectedDayHighlightColor: FlutterFlowTheme.of(context).primary,
                                        weekdayLabels: ['日', '一', '二', '三', '四', '五', '六'],
                                        weekdayLabelTextStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                              letterSpacing: 0.0,
                                            ),
                                        modePickerTextHandler: ({isMonthPicker, required monthDate}) {
                                          if (isMonthPicker ?? false) {
                                            return '${monthDate.month}月';
                                          } else {
                                            return '${monthDate.year}年';
                                          }
                                        },
                                        firstDayOfWeek: 0,
                                        animateToDisplayedMonthDate: true,
                                        controlsTextStyle: TextStyle(
                                          color: FlutterFlowTheme.of(context).secondaryText,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        dayTextStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        disabledDayTextStyle: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                        centerAlignModePicker: true,
                                        useAbbrLabelForMonthModePicker: true,
                                        modePickersGap: 0,
                                        firstDate: DateTime(2023, 8, 1),
                                        lastDate: DateTime.now().add(const Duration(days: 1)),
                                        selectableDayPredicate: (day) =>
                                            day.isAfter(DateTime(2023, 8, 1)) ||
                                            day.isBefore(DateTime.now().add(const Duration(days: 1))),
                                        dayBuilder: (
                                            {required date, decoration, isDisabled, isSelected, isToday, textStyle}) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: AspectRatio(
                                                  aspectRatio: 1,
                                                  child: Container(
                                                    decoration: decoration,
                                                    child: Center(
                                                      child: Text(
                                                        date.day.toString(),
                                                        style: textStyle?.override(
                                                          decoration: logic.is_available_hot_search_records(
                                                                  state.app, date.year, date.month, date.day)
                                                              ? TextDecoration.underline
                                                              : TextDecoration.none,
                                                          decorationThickness: 5,
                                                          decorationColor: FlutterFlowTheme.of(context).secondary,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                        monthBuilder: (
                                            {required int month,
                                            TextStyle? textStyle,
                                            BoxDecoration? decoration,
                                            bool? isSelected,
                                            bool? isDisabled,
                                            bool? isCurrentMonth}) {
                                          return Center(
                                            child: Container(
                                              decoration: decoration,
                                              height: 36,
                                              width: 72,
                                              child: Center(
                                                child: Semantics(
                                                  selected: isSelected,
                                                  button: true,
                                                  child: Text(
                                                    '$month月',
                                                    style: textStyle,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      onValueChanged: (date_list) {
                                        state.picked_date = date_list.first;
                                      },
                                      onDisplayedMonthChanged: (date) {
                                        print('Displayed month changed: ${date.year}, ${date.month}');

                                        int year = date.year;
                                        int month = date.month;
                                        logic.refresh_available_hot_search_records_bitmap(state.app, year, month);
                                      },
                                      value: [DateTime.now()],
                                    ),
                                  ],
                                  title: '直达【${state.app}】指定日期热搜',
                                  confirm_text: '确定',
                                  cancel_text: '取消',
                                  on_confirm: () async {
                                    if (state.app.isEmpty) {
                                      q0_.ui.toast.show('请先选择APP');
                                      return;
                                    }

                                    if (state.picked_date == null) {
                                      q0_.ui.toast.show('请选择日期');
                                      return;
                                    }

                                    /// 选择时间后，直接切换到指定的历史归档
                                    var year = state.picked_date!.year;
                                    var month_int_value = state.picked_date!.month;
                                    var month = month_int_value.toString();
                                    if (month_int_value < 10) {
                                      month = '0$month';
                                    }
                                    var day_int_value = state.picked_date!.day;
                                    var day = day_int_value.toString();
                                    if (day_int_value < 10) {
                                      day = '0$day';
                                    }

                                    if (state.picked_date!.isAfter(DateTime.now())) {
                                      q0_.ui.toast.show('未来的热搜还在生产哦~');
                                      return;
                                    }

                                    if (q0_.bridge.flustars.date.isToday(state.picked_date!.millisecondsSinceEpoch)) {
                                      // 选择的是今天，直接获取当天热搜
                                      var archive_dir_path = '${HotSearchMgr.root_dir}/${state.app}/$year/$month';
                                      var archive_file_path =
                                          '${HotSearchMgr.root_dir}/${state.app}/$year/$month/${state.app}.md';
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
                                            q0_.ui.toast.show('获取归档失败');
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
                                          '${HotSearchMgr.root_dir}/${state.app}/$year/$month/$year-$month-$day.md';
                                      archive_dir_path = '${HotSearchMgr.root_dir}/${state.app}/$year/$month';
                                    } else if (year >= 2023 && day_int_value >= 11) {
                                      archive_file_path =
                                          '$HotSearchMgr.root_dir/${state.app}/$year/$month/$year-$month-$day.md';
                                      archive_dir_path = '${HotSearchMgr.root_dir}/${state.app}/$year/$month';
                                    } else if (year >= 2023 && day_int_value < 8) {
                                      q0_.ui.toast.show('无归档数据');
                                    } else if (year >= 2023 && day_int_value < 11) {
                                      archive_dir_path = '${HotSearchMgr.root_dir}r/${state.app}/$year/$month';
                                    } else {
                                      q0_.ui.toast.show('无归档数据');
                                    }

                                    print(
                                        'archive_dir_path: $archive_dir_path ; archive_file_path: $archive_file_path');
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
                                          q0_.ui.toast.show('获取归档失败');
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
                      );
                    }),
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
                                  key: hot_search_scroll_view_key,
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
                                                q0_.ui.toast.show('获取内容列表失败');
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

                                    if (GithubContentType.dir == content.type) {
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
                                                q0_.ui.toast.show('获取内容列表失败');
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
                                    } else if (GithubContentType.file == content.type) {
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
                                                q0_.ui.toast.show('获取热搜失败');
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
