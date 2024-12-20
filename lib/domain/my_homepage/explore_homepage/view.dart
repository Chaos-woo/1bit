import 'package:cw2bit/infrastructure/ext/icon_extension.dart';
import 'package:cw2bit/infrastructure/router/rt0_.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui0_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/tool_group/models/tool_group.dart';
import 'components/tool_group/view.dart';
import 'logic.dart';

class ToolHomepagePage extends StatelessWidget {
  const ToolHomepagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(ToolHomepageLogic());
    final state = Get.find<ToolHomepageLogic>().state;

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        actions: [
          Icons.color_lens_outlined.flow_appbar_action_button(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 14),
              on_tap: () {
                rout0_.app_theme_home.to_then_back();
              })
        ],
        flexibleSpace: ui0_.appbar.bing_image_appbar_flexible_space(
          title: '应用探索',
          icon: Icons.category_outlined,
        ),
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
                  name: '应用反馈',
                  items: [
                    ToolGroupItemRouter(
                      title: 'App Github issues',
                      subtitle: '本软件的Github仓库issues',
                      type: EnumToolGroupItemType.router,
                      icon: Icon(Icons.quiz_rounded),
                      on_tap: () => rout0_.github_issues_home.to_then_back(),
                    ),
                    ToolGroupItemRouter(
                      title: '疑问随手记',
                      subtitle: '想法，BUG，改进点记录（本地）',
                      type: EnumToolGroupItemType.router,
                      icon: Icon(Icons.quiz_rounded),
                      on_tap: () async {},
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ToolGroupWidget(
                toolGroup: ToolGroup(
                  name: '测试库',
                  items: [
                    ToolGroupItemRouter(
                      title: 'FlutterFlow 测试库',
                      subtitle: 'FlutterFlow的组件测试合集',
                      type: EnumToolGroupItemType.router,
                      icon: Icon(Icons.flourescent_rounded),
                      on_tap: () => rout0_.flutter_flow_home.to_then_back(),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ToolGroupWidget(
                toolGroup: ToolGroup(
                  name: '实用工具',
                  items: [
                    ToolGroupItemRouter(
                      title: 'OCR-文字识别',
                      subtitle: 'Google ML-Kit识别工具',
                      type: EnumToolGroupItemType.router,
                      icon: Icon(Icons.content_paste_search_rounded),
                      on_tap: () => rout0_.public_text_ocr.to_then_back(),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ToolGroupWidget(
                toolGroup: ToolGroup(
                  name: '开发者工具',
                  items: [
                    ToolGroupItemRouter(
                      title: '应用本地数据库',
                      subtitle: '查看本应用的本地数据库内容',
                      type: EnumToolGroupItemType.router,
                      icon: Icon(Icons.table_chart_rounded),
                      on_tap: () => rout0_.public_text_ocr.to_then_back(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
