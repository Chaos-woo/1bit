import 'package:cw2bit/domain/tool/tool_homepage/view.dart';
import 'package:cw2bit/domain/wallabag/wallabag_homepage/view.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:flutter/material.dart';
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
          type: BottomNavigationBarType.shifting,
          selectedItemColor: FlutterFlowTheme.of(context).primary,
          unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
          selectedLabelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
              ),
          unselectedLabelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
              ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.token_outlined),
              label: '1Bit',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.data_exploration_outlined),
              label: '朝闻道',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.live_tv_rounded),
              label: 'TV.SO',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.addchart_rounded),
              label: '数千签',
            ),
          ],
        );
      }),
    );
  }
}
