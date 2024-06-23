import 'package:cw2bit/infrastructure/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import '../components/tool_group/models/tool_group.dart';
import '../components/tool_group/view.dart';
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
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '我的工坊',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 0,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 5),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {},
                child: Text(
                  'version' + ' >',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).alternate,
                        letterSpacing: 0,
                      ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).primary,
            borderRadius: 20,
            borderWidth: 1,
            buttonSize: 40,
            fillColor: FlutterFlowTheme.of(context).accent1,
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
              borderColor: FlutterFlowTheme.of(context).primary,
              borderRadius: 20,
              borderWidth: 1,
              buttonSize: 40,
              fillColor: FlutterFlowTheme.of(context).accent1,
              icon: Icon(
                Icons.feed_outlined,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () async {},
            ),
          ),
        ],
        centerTitle: false,
        elevation: 2,
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
                      name: '1bit',
                      items: [
                        ToolGroupItemRouter(
                          title: '1bit Github issues',
                          subtitle: 'Github仓库issues',
                          type: ToolGroupItemType.router,
                          icon: Icon(Icons.quiz_rounded),
                          onTap: () => {},
                        ),
                        ToolGroupItemRouter(
                          title: '疑问随手记',
                          subtitle: '想法，BUG，改进点记录',
                          type: ToolGroupItemType.router,
                          icon: Icon(Icons.quiz_rounded),
                          onTap: () => {},
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ToolGroupComponent(
                    toolGroup: ToolGroup(
                      name: '新鲜事',
                      items: [
                        ToolGroupItemRouter(
                          title: 'FlutterFlow 测试库',
                          subtitle: 'FlutterFlow的组件测试合集',
                          type: ToolGroupItemType.router,
                          icon: Icon(Icons.flourescent_rounded),
                          onTap: () => QKit.route.to(AppRoutes.kToolFlutterFlow),
                        )
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
}
