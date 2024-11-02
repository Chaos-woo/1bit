import 'package:animated_reorderable_list/animated_reorderable_list.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class AppHotSearchGroupAppsEditPage extends StatelessWidget {
  AppHotSearchGroupAppsEditPage({Key? key}) : super(key: key);

  final logic = Get.find<AppHotSearchGroupAppsEditLogic>(
    tag: AppHotSearchGroupAppsEditLogic.tag_format(QKit.route.path_variables('group_id')!),
  );

  final animated_groups_dnd_view_id = GlobalKey();
  final app_scroll_view_key = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
          title: '${logic.group.name} · 组 · APP编辑',
          icon: Icons.settings_rounded,
        ),
        actions: [
          FlutterFlowIconButton(
            borderRadius: 25,
            buttonSize: 50,
            icon: Icon(
              Icons.add_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {
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
            tag: AppHotSearchGroupAppsEditLogic.tag_format(logic.group.id!.toString()),
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
                              await R1Ui.dialog.show_ok_cancel_dialog(
                                  title: '删除APP',
                                  message: '确认从当前组【${logic.group.name}】删除【${e.name}】吗？',
                                  on_confirm: () async {
                                    await logic.delete_app(e.id!);
                                  });
                            },
                            child: Icon(
                              Icons.delete_outline_rounded,
                              color: Colors.red,
                            ),
                          ),
                          trailing: Icon(
                            Icons.dehaze_rounded,
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
    await R1Ui.dialog.show_custom_dialog_with_ok_cancel_buttons(
      title: '添加/删除APP',
      cancel_text: '关闭',
      context: context,
      children: [
        Container(
          width: double.infinity,
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              key: app_scroll_view_key,
              child: GetBuilder<AppHotSearchGroupAppsEditLogic>(
                id: logic.k_app_dialog_view_id,
                tag: AppHotSearchGroupAppsEditLogic.tag_format(logic.group.id!.toString()),
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
                              color: logic.is_local_db_exist(app)
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
                                          color: logic.is_local_db_exist(app) ? Colors.white : Colors.black,
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
