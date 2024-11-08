import 'package:cw2bit/infrastructure/router/router.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 20,
            borderWidth: 1,
            buttonSize: 40,
            fillColor: Colors.transparent,
            icon: Icon(
              Icons.color_lens_outlined,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () async {},
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20,
              borderWidth: 1,
              buttonSize: 40,
              fillColor: Colors.transparent,
              icon: Icon(
                Icons.feed_outlined,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () async {},
            ),
          ),
        ],
        flexibleSpace: R1Ui.appbar.bing_image_appbar_flexible_space(
          title: '1nfo-X',
          icon: Icons.category_outlined,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // wrapWithModel(
            //   model: _model.toolQuickAccessCompModel,
            //   updateCallback: () => setState(() {}),
            //   child: ToolQuickAccessCompWidget(),
            // ),
            ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ToolGroupComponent(
                    toolGroup: ToolGroup(
                      name: '应用反馈',
                      items: [
                        ToolGroupItemRouter(
                          title: 'App Github issues',
                          subtitle: '本软件的Github仓库issues',
                          type: EnumToolGroupItemType.router,
                          icon: Icon(Icons.quiz_rounded),
                          on_tap: () => QKit.route.to(rt_tool_github_issues_home),
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
                  child: ToolGroupComponent(
                    toolGroup: ToolGroup(
                      name: '测试库',
                      items: [
                        ToolGroupItemRouter(
                          title: 'FlutterFlow 测试库',
                          subtitle: 'FlutterFlow的组件测试合集',
                          type: EnumToolGroupItemType.router,
                          icon: Icon(Icons.flourescent_rounded),
                          on_tap: () => QKit.route.to(rt_tool_flutter_flow_home),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ToolGroupComponent(
                    toolGroup: ToolGroup(
                      name: '小工具',
                      items: [
                        ToolGroupItemRouter(
                          title: 'OCR-文字识别',
                          subtitle: 'Google ML-Kit识别工具',
                          type: EnumToolGroupItemType.router,
                          icon: Icon(Icons.content_paste_search_rounded),
                          on_tap: () => QKit.route.to(rt_publicTextOcr),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
