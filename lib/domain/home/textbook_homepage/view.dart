import 'package:cw2bit/domain/app_hot_search/app_hot_search_tabbar_page/view.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';

import 'logic.dart';

class TextbookHomepagePage extends StatefulWidget {
  const TextbookHomepagePage({super.key});

  @override
  State<TextbookHomepagePage> createState() => _TextbookHomepagePageState();
}

class _TextbookHomepagePageState extends State<TextbookHomepagePage> with TickerProviderStateMixin {
  final logic = Get.find<TextbookHomepageLogic>();
  final state = Get.find<TextbookHomepageLogic>().state;

  @override
  void initState() {
    super.initState();

    logic.tabbar_controller = TabController(
      vsync: this,
      length: 3,
      initialIndex: 1,
    );
  }

  @override
  void dispose() {
    super.dispose();
    logic.tabbar_controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '朝闻道',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 0,
                  ),
            ),
            Text(
              '，夕死可矣',
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    letterSpacing: 0,
                  ),
            ),
          ],
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(-1, 0),
                    child: TabBar(
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      labelColor: FlutterFlowTheme.of(context).primary,
                      unselectedLabelColor: FlutterFlowTheme.of(context).secondaryText,
                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                            letterSpacing: 0,
                          ),
                      unselectedLabelStyle: TextStyle(),
                      indicatorColor: FlutterFlowTheme.of(context).primary,
                      tabs: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 3, 0),
                              child: Icon(
                                Icons.timelapse_rounded,
                              ),
                            ),
                            Tab(
                              text: '稍后读',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 3, 0),
                              child: Icon(
                                Icons.whatshot_rounded,
                              ),
                            ),
                            Tab(
                              text: '百站热搜',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 3, 0),
                              child: Icon(
                                Icons.egg_alt,
                              ),
                            ),
                            Tab(
                              text: 'Ai 资讯',
                            ),
                          ],
                        ),
                      ],
                      controller: logic.tabbar_controller,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: logic.tabbar_controller,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                          child: Container(),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                          child: KeepAliveWidgetWrapper(
                            builder: (context) => AppHotSearchTabbarPagePage(),
                          ),
                        ),
                        Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
