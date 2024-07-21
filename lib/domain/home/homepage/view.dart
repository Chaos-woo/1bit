import 'package:cw2bit/domain/tool/tool_homepage/view.dart';
import 'package:cw2bit/domain/wallabag/wallabag_homepage/view.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomepagePage extends StatelessWidget {
  final logic = Get.find<HomepageLogic>();
  final state = Get.find<HomepageLogic>().state;

  HomepagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: logic.selectedIndex.value,
          children: [
            ToolHomepagePage(),
            WallabagHomepagePage(),
            Container(),
            Container(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: logic.selectedIndex.value,
          onTap: logic.changeIndex,
          selectedItemColor: FlutterFlowTheme.of(context).primary,
          unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.token),
              label: '试验坊',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_email_rounded),
              label: '朝闻道',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.live_tv_rounded),
              label: '流媒体',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.addchart_rounded),
              label: '标签站',
            ),
          ],
        );
      }),
    );
  }
}
