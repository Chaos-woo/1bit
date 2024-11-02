import 'package:cw2bit/domain/home/tool_homepage/components/tool_group/models/tool_group.dart';
import 'package:cw2bit/domain/home/tool_homepage/components/tool_group/view.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_setting/logic.dart';
import 'package:cw2bit/infrastructure/ext/string_ext.dart';
import 'package:cw2bit/infrastructure/router/router.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class AppHotSearchSettingPage extends StatelessWidget {
  final black_app_scroll_view_key = GlobalKey();
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
            QKit.route.back();
          },
        ),
        flexibleSpace: R1Ui.appbar.bing_image_appbar_flexible_space(
          title: '设置',
          icon: Icons.settings_rounded,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ToolGroupComponent(
                    toolGroup: ToolGroup(
                      name: '基础配置',
                      items: [
                        ToolGroupItemRouter(
                          title: 'Github Secret Key',
                          subtitle: '配置访问Github仓库数据的密钥',
                          type: EnumToolGroupItemType.router,
                          icon: Icon(Icons.security_rounded),
                          on_tap: () async {
                            await QKit.route.to(
                              rt_tool_github_setting,
                              path_variables: {
                                '${GithubSettingLogic.c_rt_path_show_1bit_repo}': false.toString(),
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
                  child: ToolGroupComponent(
                    toolGroup: ToolGroup(
                      name: 'APP · 组配置',
                      items: [
                        ToolGroupItemRouter(
                          title: 'APP · 组编辑',
                          subtitle: 'APP分组或单个分组APP的新增/删除/排序',
                          type: EnumToolGroupItemType.router,
                          icon: Icon(Icons.app_registration_rounded),
                          on_tap: () async {
                            await QKit.route.to(rt_news_apphotsearch_settings_appgroups);
                          },
                        ),
                        ToolGroupItemClicker(
                          title: 'APP黑名单',
                          subtitle: '全部/自定义组不再展示该APP',
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 黑名单弹窗
  Future<void> _on_tap_black_app(BuildContext context) async {
    var logic = Get.find<AppHotSearchSettingLogic>();

    QKit.ui.loading.show(status: '正在获取APP黑名单...');
    var apps = await logic.list_black_apps();
    QKit.ui.loading.dismiss();

    await R1Ui.dialog.show_custom_dialog_with_ok_cancel_buttons(
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
            height: 400,
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

    QKit.ui.loading.show(status: '正在获取默认APP组...');
    await logic.list_app_groups();
    QKit.ui.loading.dismiss();

    await R1Ui.dialog.show_custom_dialog_with_ok_cancel_buttons(
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
                              await R1Ui.dialog.show_single_input_dialog(
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
