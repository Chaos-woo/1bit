import 'package:animated_reorderable_list/animated_reorderable_list.dart';
import 'package:cw2bit/infrastructure/ext/icon_extension.dart';
import 'package:cw2bit/modules/c_module_app_theme/provider/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui0_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class AppHotSearchGroupAppsEditPage extends StatelessWidget {
  AppHotSearchGroupAppsEditPage({Key? key}) : super(key: key);

  final logic = Get.find<AppHotSearchGroupAppsEditLogic>(
    tag: AppHotSearchGroupAppsEditLogic.getx_tag_format(AppHotSearchGroupAppsEditLogic.m_path_variables.group_id),
  );

  final animated_groups_dnd_view_id = GlobalKey();
  final glob_k_app_scroll_view = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: ui0_.icons.arrow_back.flow_appbar_back_button(),
        flexibleSpace: ui0_.appbar.bing_image_appbar_flexible_space(
          title: '${logic.group.name} · 组 · APP编辑',
          icon: ui0_.icons.setting,
          center_title: false,
        ),
        actions: [
          ui0_.icons.add.flow_appbar_action_button(
            on_tap: () async {
              await show_add_or_delete_dialog(context);
            },
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: GetBuilder<AppHotSearchGroupAppsEditLogic>(
            id: logic.k_groups_dnd_view_id,
            tag: AppHotSearchGroupAppsEditLogic.getx_tag_format(logic.group.id!.toString()),
            builder: (_) {
              return logic.apps.isEmpty
                  ? Center(child: Text('暂无APP，快添加一个吧~'))
                  : AnimatedReorderableListView(
                      key: animated_groups_dnd_view_id,
                      items: logic.apps,
                      onReorder: (int old_index, int new_index) async =>
                          await logic.save_apps_order(old_index, new_index),
                      itemBuilder: (BuildContext context, int index) {
                        var e = logic.apps[index];
                        return ListTile(
                          key: Key('${e.id}'),
                          leading: InkWell(
                            onTap: () async {
                              await ui0_.dialog.show_ok_cancel_dialog(
                                  title: '删除APP',
                                  message: '确认从当前组【${logic.group.name}】删除【${e.name}】吗？',
                                  on_confirm: () async {
                                    await logic.delete_app(e.id!);
                                  });
                            },
                            child: Icon(
                              ui0_.icons.delete,
                              color: Colors.red,
                            ),
                          ),
                          trailing: Icon(
                            ui0_.icons.three_lines,
                            color: Colors.black54,
                          ),
                          title: Text(
                            e.name,
                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                  fontSize: 18,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          dense: true,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(10, 8, 10, 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      },
                      proxyDecorator: (child, _, __) => child,
                      isSameItem: (a, b) => a.id == b.id);
            },
          ),
        ),
      ),
    );
    ;
  }

  Future<void> show_add_or_delete_dialog(BuildContext context) async {
    await ui0_.dialog.show_custom_dialog_with_ok_cancel_buttons(
      title: '添加/删除APP',
      cancel_text: '关闭',
      on_cancel: () {},
      context: context,
      children: [
        Container(
          width: double.infinity,
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              key: glob_k_app_scroll_view,
              child: GetBuilder<AppHotSearchGroupAppsEditLogic>(
                id: logic.k_app_dialog_view_id,
                tag: AppHotSearchGroupAppsEditLogic.getx_tag_format(logic.group.id!.toString()),
                builder: (_) {
                  return Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      for (var app in logic.all_apps_from_git)
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            /// 添加APP或删除APP
                            await logic.add_or_delete_app(app).throttle();
                          },
                          child: Container(
                            height: 28,
                            constraints: BoxConstraints(
                              minWidth: 65,
                              maxWidth: 150,
                            ),
                            decoration: BoxDecoration(
                              color: logic.is_in_local_database(app)
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).primaryBackground,
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
                                          color: logic.is_in_local_database(app) ? Colors.white : Colors.black,
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
