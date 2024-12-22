import 'dart:async';

import 'package:cw2bit/domain/feature_explore/github_1bit/issues/components/github_setting/logic.dart';
import 'package:cw2bit/domain/app_homepage/explore_homepage/components/tool_group/models/tool_group.dart';
import 'package:cw2bit/domain/app_homepage/explore_homepage/components/tool_group/view.dart';
import 'package:cw2bit/infrastructure/ext/icon_extension.dart';
import 'package:cw2bit/infrastructure/ext/string_ext.dart';
import 'package:cw2bit/infrastructure/router/rt0_.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui0_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class AppHotSearchSettingPage extends StatelessWidget {
  final black_app_scroll_view_key = GlobalKey();
  final reading_record_white_app_scroll_view_key = GlobalKey();
  final default_app_scroll_view_key = GlobalKey();

  AppHotSearchSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(AppHotSearchSettingLogic());

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: ui0_.icons.arrow_back.flow_appbar_back_button(),
        flexibleSpace: ui0_.appbar.bing_image_appbar_flexible_space(
          title: '个性化设置',
          icon: Icons.settings_rounded,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          shrinkWrap: false,
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: ToolGroupWidget(
                toolGroup: ToolGroup(
                  name: '基础配置',
                  items: [
                    ToolGroupItemRouter(
                      title: 'Github Secret Key',
                      subtitle: '配置访问Github仓库数据的密钥',
                      type: EnumToolGroupItemType.router,
                      icon: Icon(Icons.security_rounded),
                      on_tap: () async {
                        rout0_.github_setting.to_then_back(
                          path_variables: {
                            '${GithubSettingLogic.m_path_variables.path_k_show_1bit_repo}': false.toString(),
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ToolGroupWidget(
                toolGroup: ToolGroup(
                  name: 'APP · 组配置',
                  items: [
                    ToolGroupItemRouter(
                      title: 'APP · 组编辑',
                      subtitle: 'APP分组或单个分组中APP的编辑',
                      type: EnumToolGroupItemType.router,
                      icon: Icon(Icons.app_registration_rounded),
                      on_tap: () async {
                        rout0_.app_hot_search_settings_app_groups.to_then_back();
                      },
                    ),
                    ToolGroupItemClicker(
                      title: 'APP黑名单',
                      subtitle: '全部/自定义组不再展示该APP，将默认生成一个黑名单组展示这些APP',
                      type: EnumToolGroupItemType.clicker,
                      icon: Icon(Icons.playlist_remove_rounded),
                      on_tap: () async => await _on_tap_black_app(context),
                    ),
                    ToolGroupItemClicker(
                      title: '默认APP组',
                      subtitle: '将指定组设置为进入应用时优先展示的组',
                      type: EnumToolGroupItemType.clicker,
                      icon: Icon(Icons.add_home_work_outlined),
                      on_tap: () async => await _on_tap_default_app_group(context),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ToolGroupWidget(
                toolGroup: ToolGroup(
                  name: '热搜看点设置',
                  items: [
                    ToolGroupItemClicker(
                      title: '热搜归档阈值',
                      subtitle: '超过阈值被视为阅读完成，影响阅读进度/阅读中/归档的展示',
                      type: EnumToolGroupItemType.router,
                      icon: Icon(Icons.playlist_add),
                      on_tap: () async {
                        /// 跳转设置页为每个APP进行设置
                        await rout0_.app_reading_threshold_config.to_then_back();
//                         await ui0_.dialog.show_single_input_dialog(
//                             title: '阈值设置',
//                             subtitle: '''
// 1. 视为阅读完成的阈值默认值为80。
// 2. 数值范围为0~90，部分网页很难达到95或100，所以建议设置80到90之间。
//                                 ''',
//                             default_value: (await logic.get_read_progress_threshold()).toString(),
//                             on_cancel: () {},
//                             max_length: -1,
//                             on_confirm: (value) async {
//                               var threshold = int.tryParse(value);
//                               if (threshold == null || threshold < 0 || threshold > 90) {
//                                 q0_.ui.toast.show('请输入有效的阅读完成阈值，范围为0~90');
//                               } else {
//                                 logic.set_read_progress_threshold(threshold);
//                               }
//                             });
                      },
                    ),
                    ToolGroupItemClicker(
                      title: '热搜阅读记录白名单',
                      subtitle: '记录指定APP的热搜文章阅读进度',
                      type: EnumToolGroupItemType.clicker,
                      icon: Icon(Icons.app_registration_rounded),
                      on_tap: () async => await _on_tap_reading_record_white_list(context),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ToolGroupWidget(
                toolGroup: ToolGroup(
                  name: '关于',
                  items: [
                    ToolGroupItemClicker(
                      title: '热搜数据来源',
                      subtitle: '热搜数据的来源说明',
                      type: EnumToolGroupItemType.clicker,
                      icon: ui0_.icons.info.to_icon(),
                      on_tap: () async {
                        await ui0_.dialog.show_ok_cancel_dialog(
                          title: '热搜数据来源',
                          message: '''
1. 热搜数据来源1：WShuai123/hot_searches_for_apps（Github）。

2. 热搜数据来源2：Chaos-woo/riibit（Github，数据源1在2024年10月16日不再提供新数据，数据源2将接替数据源1继续提供数据，提供数据从2024年12月1日起）。

3. 热搜阅读记录来源：本地数据库，根据用户阅读习惯记录热搜文章的阅读进度、文章分析数据等。
                              ''',
                        );
                      },
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

  /// 热搜阅读进度白名单
  Future<void> _on_tap_reading_record_white_list(BuildContext context) async {
    var logic = Get.find<AppHotSearchSettingLogic>();

    q0_.ui.loading.show(loading_tip: '正在获取APP记录白名单...');
    Timer(600.milliseconds, () => q0_.ui.loading.dismiss());
    var apps = await logic.list_reading_record_white_apps();

    await ui0_.dialog.show_custom_dialog_with_ok_cancel_buttons(
      title: '热搜阅读进度白名单',
      cancel_text: '关闭',
      on_cancel: () => logic.m_black_list = [],
      barrier_dismissible: false,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            '''
1. 高亮的APP下的热搜文章，在阅读时根据阅读进度，进行记录并展示在【看点记录】中，其他APP的热搜文章仅展示“看过”。
2. 默认情况下，不记录APP的热搜文章阅读进度。
3. 若APP被设置【APP黑名单】，此处不可勾选APP。
4. 若APP未在此处添加到白名单中，APP的阅读进度阈值设置页面无法设置该APP的阅读进度阈值，且无法生效。
            ''',
            maxLines: 8,
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              key: reading_record_white_app_scroll_view_key,
              child: GetBuilder<AppHotSearchSettingLogic>(
                id: logic.k_reading_record_white_list_view_id,
                builder: (_) {
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
                                /// 设置APP是否记录阅读进度，添加或删除
                                await logic.add_or_delete_reading_record_app(app);
                              },
                              child: logic.m_reading_record_white_list.contains_case_insensitive(app)
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
                                              app,
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
                                              app,
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
            ),
          ),
        ),
      ],
    );
  }

  /// 黑名单弹窗
  Future<void> _on_tap_black_app(BuildContext context) async {
    var logic = Get.find<AppHotSearchSettingLogic>();

    q0_.ui.loading.show(loading_tip: '正在获取APP黑名单...');
    Timer(600.milliseconds, () => q0_.ui.loading.dismiss());
    var apps = await logic.list_black_apps();

    await ui0_.dialog.show_custom_dialog_with_ok_cancel_buttons(
      title: 'APP黑名单',
      cancel_text: '关闭',
      on_cancel: () => logic.m_black_list = [],
      barrier_dismissible: false,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            '高亮的APP将不再展示在 "全部" 组和其他 "自定义" APP分组中',
            maxLines: 2,
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              key: black_app_scroll_view_key,
              child: GetBuilder<AppHotSearchSettingLogic>(
                id: logic.k_black_list_view_id,
                builder: (_) {
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
                                /// 将APP从黑名单添加或删除
                                await logic.add_or_delete_black_app(app);
                              },
                              child: logic.m_black_list.contains_case_insensitive(app)
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
                                              app,
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
                                              app,
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
            ),
          ),
        ),
      ],
    );
  }

  /// 默认APP组弹窗
  Future<void> _on_tap_default_app_group(BuildContext context) async {
    var logic = Get.find<AppHotSearchSettingLogic>();

    q0_.ui.loading.show(loading_tip: '正在获取默认APP组...');
    Timer(100.milliseconds, () => q0_.ui.loading.dismiss());
    await logic.list_app_groups();

    await ui0_.dialog.show_custom_dialog_with_ok_cancel_buttons(
      title: '默认APP组',
      cancel_text: '关闭',
      on_cancel: () => logic.m_default_group_id = null,
      barrier_dismissible: false,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            '将指定组设置为进入应用时优先展示的组',
            maxLines: 2,
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              key: default_app_scroll_view_key,
              child: GetBuilder<AppHotSearchSettingLogic>(
                id: logic.k_default_app_group_view_id,
                builder: (_) {
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
                          for (var group in logic.app_groups)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                /// 设置或取消默认APP组
                                await logic.set_default_app_group(group.id!);
                              },
                              child: group.id == logic.m_default_group_id
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
                                              group.name,
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
                                              group.name,
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

                          /// 增加1个快速新增APP组的按钮
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              /// 新增APP组
                              await ui0_.dialog.show_single_input_dialog(
                                title: '新建APP组',
                                subtitle: '创建自定义名字的分组，方便管理APP',
                                hint_text: '输入组名称',
                                label_text: '组名称',
                                context: context,
                                max_length: 3,
                                on_confirm: (String value) async {
                                  await logic.add_new_app_group(value);
                                },
                              );
                            },
                            child: Container(
                              height: 28,
                              constraints: BoxConstraints(
                                minWidth: 65,
                                maxWidth: 150,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '+',
                                      textAlign: TextAlign.justify,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
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
            ),
          ),
        ),
      ],
    );
  }
}
