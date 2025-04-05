import 'dart:ui';

import 'package:cw2bit/infra/a_ui/multi_list_tile.dart';
import 'package:cw2bit/modules/c_module_theme/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MyHomePage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  MyHomePage({super.key});

  final logic = Get.put(MyHomeLogic());
  final state = Get.find<MyHomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              height: 500,
              child: Stack(
                alignment: AlignmentDirectional(0, -1),
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.05, -1),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1286&q=80',
                      width: double.infinity,
                      height: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Color(0x8D090F13),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'Hello WorldHello World',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 80,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 250,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // 高斯模糊程度
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSlogan(context),
                          _buildMainContent(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildMainContent(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
      child: Container(
        width: double.infinity,
        height: 700,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  height: 8,
                  thickness: 4,
                  indent: 140,
                  endIndent: 140,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                INKMultiListTile(
                  title: '全局设置',
                  items: [
                    JumpingListTileItem(
                      title: '外观主题',
                      subtitle: '选择外观主题颜色，定制你的界面',
                      onTap: () async {},
                      icon: Icons.color_lens_outlined,
                    ),
                  ],
                ),
                INKMultiListTile(
                  title: '实验室',
                  items: [
                    JumpingListTileItem(
                      title: 'Github Access',
                      subtitle: '管理 GitHub 访问权限，项目内容通过GetHub Personal Access Token访问',
                      onTap: () async {},
                      icon: Icons.bug_report_outlined,
                    ),
                    JumpingListTileItem(
                      title: '𝕚𝗡𝕜.Project issues',
                      subtitle: '项目问题列表，使用分类和筛选功能，跟踪解决进度',
                      onTap: () async {},
                      icon: Icons.bug_report_outlined,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildSlogan(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
              child: Text(
                'Connect Words',
                style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(32, 0, 16, 10),
              child: Text(
                'with Your Thoughts.',
                style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Inter Tight',
                      color: Color(0xFFF2F2F2),
                      fontSize: 24,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Text(
                'Connect Worlds',
                style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(32, 0, 16, 0),
              child: Text(
                'with Your Style.',
                style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Inter Tight',
                      color: Color(0xFFF2F2F2),
                      fontSize: 24,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
