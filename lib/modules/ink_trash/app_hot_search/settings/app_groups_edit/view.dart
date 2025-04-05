import 'package:animated_reorderable_list/animated_reorderable_list.dart';
import 'package:cw2bit/modules/app_hot_search/settings/group_apps_edit/logic.dart';
import 'package:cw2bit/infrastructure/ext/icon_extension.dart';
import 'package:cw2bit/infrastructure/router/RTs.dart';
import 'package:cw2bit/modules/c_module_theme/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui0_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AppHotSearchAppGroupsEditPage extends StatelessWidget {
  AppHotSearchAppGroupsEditPage({Key? key}) : super(key: key);

  final glob_k_animated_groups_dnd = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(AppHotSearchAppGroupsEditLogic());

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: ui0_.icons.arrow_back.flow_appbar_back_button(),
        flexibleSpace: ui0_.appbar.bing_image_appbar_flexible_space(
          title: 'APP · 组编辑',
          icon: Icons.settings_rounded,
          center_title: false,
        ),
        actions: [
          GetBuilder<AppHotSearchAppGroupsEditLogic>(
              id: logic.k_groups_dnd_view_id,
              builder: (_) {
                var icon = logic.is_sortable ? ui0_.icons.circle_ok : ui0_.icons.sort;
                return icon.flow_appbar_action_button(
                  on_tap: () async {
                    await logic.switch_sortable_or_not(!logic.is_sortable);
                  },
                );
              }),
          ui0_.icons.add.flow_appbar_action_button(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 14),
            on_tap: () async {
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
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: GetBuilder<AppHotSearchAppGroupsEditLogic>(
            id: logic.k_groups_dnd_view_id,
            builder: (_) {
              return logic.app_groups.isEmpty
                  ? Center(child: Text('暂无APP组，快新增一个吧~'))
                  : AnimatedReorderableListView(
                      key: glob_k_animated_groups_dnd,
                      longPressDraggable: logic.is_sortable,
                      items: logic.app_groups,
                      onReorder: (int old_index, int new_index) async =>
                          await logic.save_app_groups_order(old_index, new_index),
                      itemBuilder: (BuildContext context, int index) {
                        var e = logic.app_groups[index];
                        return ListTile(
                          key: Key('${e.id}'),
                          leading: logic.is_sortable
                              ? null
                              : ui0_.icons.delete.ink_button(
                                  color: Colors.red,
                                  on_tap: () async {
                                    await ui0_.dialog.show_ok_cancel_dialog(
                                        title: '删除APP分组',
                                        message: '确认删除分组？：${e.name}',
                                        on_cancel: () {},
                                        on_confirm: () async {
                                          await logic.delete_app_group(e.id!);
                                        });
                                  }),
                          trailing: logic.is_sortable
                              ? Icon(
                                  ui0_.icons.three_lines,
                                  color: Colors.black54,
                                )
                              : ui0_.button.plant_button(
                                  '编辑',
                                  on_tap: () async {
                                    await ui0_.dialog.show_single_input_dialog(
                                      title: '编辑APP组',
                                      subtitle: '自定义名字的分组，方便管理APP',
                                      hint_text: '输入组名称',
                                      label_text: '组名称',
                                      context: context,
                                      max_length: 3,
                                      initial_value: e.name,
                                      on_confirm: (String value) async {
                                        await logic.update_app_group_name(e.id!, value);
                                      },
                                    );
                                  },
                                ),
                          title: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: logic.is_sortable
                                ? null
                                : () async {
                                    await rout0_.app_hot_search_settings_group_apps.to(
                                      argument: e,
                                      pathVariables: {
                                        AppHotSearchGroupAppsEditLogic.m_path_variables.path_k_group_id:
                                            e.id.toString(),
                                      },
                                      prevent_duplicates: false,
                                    );
                                  },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  e.name,
                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                        fontSize: 18,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
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
  }
}
