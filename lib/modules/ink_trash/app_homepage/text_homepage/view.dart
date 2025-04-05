import 'package:cw2bit/modules/app_hot_search/history_hot_search/index/view.dart';
import 'package:cw2bit/modules/app_hot_search/reading_record/view.dart';
import 'package:cw2bit/modules/app_hot_search/today_hot_search/index/view.dart';
import 'package:cw2bit/modules/c_module_theme/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui0_.dart';
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
      length: 4,
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
        actions: [],
        flexibleSpace: ui0_.appbar.bing_image_appbar_flexible_space(
          title: '文字小站',
          icon: Icons.art_track_rounded,
        ),
        centerTitle: false,
        elevation: 0,
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
                              text: '稍后再看',
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
                              text: '今日看点',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 3, 0),
                              child: Icon(
                                Icons.toc_rounded,
                              ),
                            ),
                            Tab(
                              text: '看点记录',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 3, 0),
                              child: Icon(
                                Icons.filter_b_and_w_rounded,
                              ),
                            ),
                            Tab(
                              text: '昨日旧闻',
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
                            builder: (context) => TodayHotSearchPage(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                          child: KeepAliveWidgetWrapper(
                            builder: (context) => ReadingRecordPage(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                          child: KeepAliveWidgetWrapper(
                            builder: (context) => HistoryHotSearchPage(),
                          ),
                        ),
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
