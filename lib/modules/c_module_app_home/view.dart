import 'package:cw2bit/infra/a_ui/state/fade_indexed_stack.dart';
import 'package:cw2bit/modules/c_module_app_home/pages/my_home/view.dart';
import 'package:cw2bit/modules/c_module_app_theme/provider/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomepagePage extends StatelessWidget {
  final logic = Get.find<HomepageLogic>();
  final state = Get.find<HomepageLogic>().state;

  /// fade transmit indexed stack的全局Key，避免无法恢复状态数据
  final globIndexStackKey = GlobalKey();

  /// 底部导航栏item
  final items = [
    {'icon': Icons.link_rounded, 'label': 'ℱlow'},
    {'icon': Icons.videogame_asset_rounded, 'label': '𝔾ames'},
    {'icon': Icons.ondemand_video_rounded, 'label': 'ℝss'},
    {'icon': Icons.book_outlined, 'label': '𝕄arker'},
    {'icon': Icons.category_outlined, 'label': '𝔼xplore'},
  ];

  HomepagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return FadeIndexedStack(
          key: globIndexStackKey,
          index: logic.mSelectedBottomBarIndex.value,
          children: [
            TextbookHomepagePage(),
            Container(
              child: Center(
                child: Text('制作中...'),
              ),
            ),
            Container(
              child: Center(
                child: Text('制作中...'),
              ),
            ),
            Container(
              child: Center(
                child: Text('制作中...'),
              ),
            ),
            MyHomePage(),
          ],
        );
      }),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      bottomNavigationBar: Obx(() {
        return SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: SnakeShape.circle,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          // padding: const EdgeInsets.all(12),
          backgroundColor: Colors.white,
          snakeViewColor: FlutterFlowTheme.of(context).primary.withValues(alpha: 0.9),
          selectedItemColor: null,
          unselectedItemColor: Colors.blueGrey,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: logic.selectedBottomBarIndex,
          onTap: (index) => logic.selectBottomBar(index),
          height: 55,
          items: items.map((item) {
            return BottomNavigationBarItem(
              icon: Icon(
                item['icon'] as IconData,
                size: 18,
              ),
              label: item['label'] as String,
            );
          }).toList(),
        );
      }),
    );
  }
}
