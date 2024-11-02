import 'package:animated_reorderable_list/animated_reorderable_list.dart';
import 'package:cw2bit/infrastructure/router/router.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class AppHotSearchAppGroupsEditPage extends StatelessWidget {
  AppHotSearchAppGroupsEditPage({Key? key}) : super(key: key);

  final animated_groups_dnd_view_id = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(AppHotSearchAppGroupsEditLogic());

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
          title: 'APP · 组编辑',
          icon: Icons.settings_rounded,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2),
            child: GetBuilder<AppHotSearchAppGroupsEditLogic>(
                id: logic.k_groups_dnd_view_id,
                builder: (_) {
                  var icon = Icon(
                    logic.is_long_press_dragging ? Icons.blur_off_rounded : Icons.blur_on_rounded,
                    color: Colors.white,
                    size: 25,
                  );
                  return FlutterFlowIconButton(
                    borderRadius: 20,
                    buttonSize: 40,
                    icon: icon,
                    onPressed: () async {
                      await logic.switch_long_press_dragging(!logic.is_long_press_dragging);
                    },
                  );
                }),
          ),
          FlutterFlowIconButton(
            borderRadius: 25,
            buttonSize: 50,
            icon: Icon(
              Icons.add_rounded,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () async {
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
                      key: animated_groups_dnd_view_id,
                      longPressDraggable: logic.is_long_press_dragging,
                      items: logic.app_groups,
                      onReorder: (int old_index, int new_index) async =>
                          await logic.save_app_groups_order(old_index, new_index),
                      itemBuilder: (BuildContext context, int index) {
                        var e = logic.app_groups[index];
                        return ListTile(
                          key: Key('${e.id}'),
                          leading: logic.is_long_press_dragging
                              ? null
                              : InkWell(
                                  onTap: () async {
                                    await R1Ui.dialog.show_ok_cancel_dialog(
                                        title: '删除APP组',
                                        message: '确认删除【${e.name}】组吗？',
                                        on_confirm: () async {
                                          await logic.delete_app_group(e.id!);
                                        });
                                  },
                                  child: Icon(
                                    Icons.delete_outline_rounded,
                                    color: Colors.red,
                                  ),
                                ),
                          trailing: logic.is_long_press_dragging
                              ? Icon(
                                  Icons.density_medium_rounded,
                                  color: Colors.black54,
                                )
                              : null,
                          title: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: logic.is_long_press_dragging
                                ? null
                                : () async {
                                    await QKit.route.to(
                                      rt_news_apphotsearch_settings_groupapps,
                                      argument: e,
                                      path_variables: {'group_id': e.id.toString()},
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
