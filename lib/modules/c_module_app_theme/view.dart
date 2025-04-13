import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:cw2bit/infra/a_ui/button/circle_button.dart';
import 'package:cw2bit/infra/a_ui/button/easy_circle_button.dart';
import 'package:cw2bit/modules/c_module_app_theme/pages/widgets/theme_card_widget.dart';
import 'package:cw2bit/modules/c_module_app_theme/provider/flutterflow_theme.dart';
import 'package:cw2bit/modules/c_module_app_theme/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AppThemePage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final themeScrollKey = GlobalKey<ScrollableState>();

  AppThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppThemeLogic logic = Get.put(AppThemeLogic());
    final AppThemeState state = Get.find<AppThemeLogic>().state;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: INKEasyCircleBtn.back(),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                    child: Text(
                      '主题选择',
                      style: FlutterFlowTheme.of(context).headlineMedium.override(letterSpacing: 0.0),
                    ),
                  ),
                  INKCircleButton(
                    icon: Icons.edit_note_rounded,
                    onTap: () {
                      // 新增自定义配色
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 4, 0, 0),
              child: Text(
                '选择外观主题颜色，定制你的界面',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).labelMedium.override(letterSpacing: 0.0),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
                child: GetBuilder<AppThemeLogic>(
                  id: logic.kGetxThemeScrollView,
                  builder: (_) {
                    var themeRows = logic.getThemeSelections(INKs.sdk.screen.screenWidth);

                    return SingleChildScrollView(
                      key: themeScrollKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          for (var themeRow in themeRows)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // 主题卡片
                                for (var selection in themeRow)
                                  ThemeCard(
                                    name: selection.name,
                                    isSelected: selection.isSelected,
                                    onSelect: (_) async {
                                      await logic.selectTheme(selection);
                                    },
                                    primaryColor: selection.primaryColor,
                                    secondaryColor: selection.secondaryColor,
                                    tertiaryColor: selection.tertiaryColor,
                                    primaryDarkColor: selection.primaryDarkColor,
                                    secondaryDarkColor: selection.secondaryDarkColor,
                                    tertiaryDarkColor: selection.tertiaryDarkColor,
                                  ),
                              ],
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
