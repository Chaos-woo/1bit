import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:cw2bit/infrastructure/ext/icon_extension.dart';
import 'package:cw2bit/modules/c_module_theme/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/theme/themes.dart';
import 'package:cw2bit/public/ui/ui0_.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class AppThemePage extends StatelessWidget {
  final glob_k_scaffold_key = GlobalKey<ScaffoldState>();

  AppThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(AppThemeLogic());

    return Scaffold(
      key: glob_k_scaffold_key,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: ui0_.icons.arrow_back.flow_appbar_back_button(),
        actions: [],
        flexibleSpace: ui0_.appbar.bing_image_appbar_flexible_space(
          title: '主题色',
          icon: Icons.color_lens_outlined,
          center_title: false,
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: GetBuilder<AppThemeLogic>(
              id: logic.k_theme_list_view_id,
              builder: (_) {
                var theme_mgr = c0_.mgr_theme;
                int index = theme_mgr.get_theme_index();
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (var theme in theme_mgr.mThemes.entries)
                        if (theme.key == index)
                          InkWell(
                            onTap: () async {
                              await logic.change_theme(theme.key);
                            },
                            child: selected_theme_widget(context, theme.value),
                          )
                        else
                          InkWell(
                            onTap: () async {
                              await logic.change_theme(theme.key);
                            },
                            child: unselected_theme_widget(context, theme.value),
                          )
                    ].divide(SizedBox(height: 10)),
                  ),
                );
              }),
        ),
      ),
    );
  }

  Widget unselected_theme_widget(BuildContext context, MyAppTheme theme) {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Color(0xFFE2F6F3),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'light',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        letterSpacing: 0.0,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.light.primary,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.light.secondary,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.light.tertiary,
                      ),
                    ),
                  ],
                ),
                Text(
                  'dark',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        letterSpacing: 0.0,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.dark.primary,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.dark.secondary,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.dark.tertiary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Text(
                  theme.name,
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 5)),
        ),
      ),
    );
  }

  Widget selected_theme_widget(BuildContext context, MyAppTheme theme) {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Color(0xFF38D0BD),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'light',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        letterSpacing: 0.0,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.light.primary,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.light.secondary,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.light.tertiary,
                      ),
                    ),
                  ],
                ),
                Text(
                  'dark',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        letterSpacing: 0.0,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.dark.primary,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.dark.secondary,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.dark.tertiary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Text(
                  theme.name,
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 5)),
        ),
      ),
    );
  }
}
