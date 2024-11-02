import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'models/tool_group.dart';

class ToolGroupComponent extends StatelessWidget {
  final ToolGroup toolGroup;

  ToolGroupComponent({Key? key, required this.toolGroup}) : super(key: key);

  final logic = Get.put(ToolGroupLogic());
  final state = Get.find<ToolGroupLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
            child: Text(
              toolGroup.name,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0,
                  ),
            ),
          ),
          Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: 0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8),
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  for (var toolItem in toolGroup.items) buildItem(toolItem, context),
                ].divide(SizedBox(height: 1)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(ToolGroupItem item, BuildContext context) {
    Widget widget;
    switch (item.type) {
      case EnumToolGroupItemType.router:
        widget = build_router_item(context, item as ToolGroupItemRouter);
      case EnumToolGroupItemType.display:
        widget = build_display_item(context, item);
      case EnumToolGroupItemType.switcher:
        widget = build_switcher_item(context, item as ToolGroupItemSwitcher);
      case EnumToolGroupItemType.clicker:
        widget = build_clicker_item(context, item as ToolGroupItemClicker);
    }
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
      child: widget,
    );
  }

  ListTile build_display_item(BuildContext context, ToolGroupItem item) {
    return ListTile(
      leading: item.icon,
      title: Text(
        item.title,
        style: FlutterFlowTheme.of(context).titleLarge.override(
              fontSize: 18,
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
            ),
      ),
      subtitle: Text(
        item.subtitle,
        style: FlutterFlowTheme.of(context).labelSmall.override(
              letterSpacing: 0,
            ),
      ),
      tileColor: FlutterFlowTheme.of(context).secondaryBackground,
      dense: false,
    );
  }

  ListTile build_clicker_item(BuildContext context, ToolGroupItemClicker item) {
    return ListTile(
      leading: item.icon,
      title: Text(
        item.title,
        style: FlutterFlowTheme.of(context).titleLarge.override(
              fontSize: 18,
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
            ),
      ),
      subtitle: Text(
        item.subtitle,
        style: FlutterFlowTheme.of(context).labelSmall.override(
              letterSpacing: 0,
            ),
      ),
      trailing: Icon(
        Icons.settings_backup_restore_rounded,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 16,
      ),
      tileColor: FlutterFlowTheme.of(context).secondaryBackground,
      dense: false,
      onTap: () async => await item.on_tap?.call(),
    );
  }

  ListTile build_switcher_item(BuildContext context, ToolGroupItemSwitcher switcher) {
    return ListTile(
      leading: switcher.icon,
      trailing: Obx(() => SwitchListTile.adaptive(
            value: switcher.value.value,
            activeColor: FlutterFlowTheme.of(context).primary,
            activeTrackColor: FlutterFlowTheme.of(context).accent1,
            dense: false,
            onChanged: (value) {
              switcher.value.value = value;
              switcher.onChanged?.call(switcher.value);
            },
          )),
      title: Text(
        switcher.title,
        style: FlutterFlowTheme.of(context).titleLarge.override(
              fontSize: 18,
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
            ),
      ),
      subtitle: Text(
        switcher.subtitle,
        style: FlutterFlowTheme.of(context).labelSmall.override(
              letterSpacing: 0,
            ),
      ),
      tileColor: FlutterFlowTheme.of(context).secondaryBackground,
      dense: true,
    );
  }

  InkWell build_router_item(BuildContext context, ToolGroupItemRouter router) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        router.on_tap?.call();
      },
      child: ListTile(
        leading: router.icon,
        title: Text(
          router.title,
          style: FlutterFlowTheme.of(context).titleLarge.override(
                fontSize: 18,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
              ),
        ),
        subtitle: Text(
          router.subtitle,
          style: FlutterFlowTheme.of(context).labelSmall.override(
                letterSpacing: 0,
              ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 20,
        ),
        tileColor: FlutterFlowTheme.of(context).secondaryBackground,
        dense: true,
      ),
    );
  }
}
