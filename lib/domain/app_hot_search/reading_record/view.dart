import 'package:cw2bit/domain/app_hot_search/reading_record/components/hot_search_archive.dart';
import 'package:cw2bit/domain/app_hot_search/reading_record/components/hot_search_favorite.dart';
import 'package:cw2bit/domain/app_hot_search/reading_record/components/hot_search_in_reading.dart';
import 'package:cw2bit/infrastructure/ext/icon_extension.dart';
import 'package:cw2bit/infrastructure/router/rt0_.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui0_.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class ReadingRecordPage extends StatefulWidget {
  const ReadingRecordPage({super.key});

  @override
  State<ReadingRecordPage> createState() => _ReadingRecordPageState();
}

class _ReadingRecordPageState extends State<ReadingRecordPage> with TickerProviderStateMixin {
  final logic = Get.put(ReadingRecordLogic());
  final state = Get.find<ReadingRecordLogic>().state;

  @override
  void initState() {
    super.initState();

    logic.tabbar_controller = TabController(
      vsync: this,
      length: ReadingRecordLogic.m_path_variables.max_tab_index,
      initialIndex: ReadingRecordLogic.m_path_variables.initial_tab_index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 2, 5, 0),
                      child: Icon(
                        Icons.local_fire_department_rounded,
                        color: Color(0xFFF95232),
                        size: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await logic.refresh_reading_records();
                        q0_.ui.toast.show('刷新完成');
                      },
                      onLongPress: () => q0_.ui.toast.show('短按刷新所有阅读记录噢'),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                            child: Text(
                              '热搜看点记录',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                            child: Icons.refresh_rounded.to_icon(size: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 5),
                      child: ui0_.icons.setting.ink_button(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        on_tap: () async {
                          /// 跳转设置页
                          await rout0_.app_hot_search_settings_home.to_then_back();
                        },
                      ),
                    ),
                    q0_.ui.gap.vertical_divider(container_height: 15, size: 1, color: Colors.grey, thickness: 1.5),
                    ui0_.icons.sort.ink_button(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      on_tap: () async {
                        /// TODO 排序
                      },
                    ),
                    ui0_.icons.filter.ink_button(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      on_tap: () async {
                        /// TODO 筛选
                      },
                    ),
                  ].divide(SizedBox(width: 10)),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(0, 0),
                    child: FlutterFlowButtonTabBar(
                      useToggleButtonStyle: true,
                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                            fontSize: 14,
                            letterSpacing: 0.0,
                            lineHeight: 1,
                          ),
                      unselectedLabelStyle: TextStyle(),
                      labelColor: FlutterFlowTheme.of(context).primary,
                      unselectedLabelColor: FlutterFlowTheme.of(context).secondaryText,
                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                      unselectedBackgroundColor: FlutterFlowTheme.of(context).alternate,
                      borderColor: FlutterFlowTheme.of(context).primary,
                      unselectedBorderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 1,
                      borderRadius: 8,
                      elevation: 0,
                      buttonMargin: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                      tabs: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 3, 3),
                              child: Icon(
                                Icons.playlist_add_circle_rounded,
                                size: 18,
                              ),
                            ),
                            Tab(
                              text: '阅读中',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 3, 3),
                              child: Icon(
                                Icons.playlist_add_check_circle_rounded,
                                size: 18,
                              ),
                            ),
                            Tab(
                              text: '归档',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 3, 3),
                              child: Icon(
                                Icons.stars_rounded,
                                size: 18,
                              ),
                            ),
                            Tab(
                              text: '收藏',
                            ),
                          ],
                        ),
                      ],
                      controller: logic.tabbar_controller,
                      onTap: (tab_index) async {
                        await [() async {}, () async {}, () async {}][tab_index]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: logic.tabbar_controller,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        KeepAliveWidgetWrapper(
                          key: logic.glob_k_hot_search_in_reading,
                          builder: (context) => HotSearchInReading(list_view_key: UniqueKey()),
                        ),
                        KeepAliveWidgetWrapper(
                          key: logic.glob_k_hot_search_archive,
                          builder: (context) => HotSearchArchive(list_view_key: UniqueKey()),
                        ),
                        KeepAliveWidgetWrapper(
                          key: logic.glob_k_hot_search_favorite,
                          builder: (context) => HotSearchFavorite(list_view_key: UniqueKey()),
                        ),
                      ],
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
