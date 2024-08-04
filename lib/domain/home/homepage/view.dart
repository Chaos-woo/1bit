import 'package:cw2bit/domain/home/textbook_homepage/view.dart';
import 'package:cw2bit/domain/home/tool_homepage/view.dart';
import 'package:cw2bit/public/animation/faed_index_stack.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomepagePage extends StatelessWidget {
  final logic = Get.find<HomepageLogic>();
  final state = Get.find<HomepageLogic>().state;

  /// fade transmit indexed stack的全局Key，避免无法恢复状态数据
  final indexed_stack_key = GlobalKey();

  /// 底部导航栏item
  final items = [
    {'icon': Icons.token_outlined, 'label': '1Bit'},
    {'icon': Icons.data_exploration_outlined, 'label': '朝闻道'},
    {'icon': Icons.live_tv_rounded, 'label': 'TV.SO'},
    {'icon': Icons.addchart_rounded, 'label': '数千签'},
  ];

  HomepagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return FadeIndexedStack(
          key: indexed_stack_key,
          index: logic.m_selected_index.value,
          children: [
            ToolHomepagePage(),
            TextbookHomepagePage(),
            Container(),
            Container(),
          ],
        );
      }),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      bottomNavigationBar: Obx(() {
        return SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: SnakeShape.circle,
          shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
          // padding: const EdgeInsets.all(12),
          backgroundColor: Colors.white,
          snakeViewColor: FlutterFlowTheme.of(context).primary,
          selectedItemColor: null,
          unselectedItemColor: Colors.blueGrey,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: logic.selected_index,
          onTap: (index) => logic.update_page_index(index),
          height: 55,
          items: items.map((item) {
            return BottomNavigationBarItem(
                icon: Icon(item['icon'] as IconData), label: item['label'] as String);
          }).toList(),
        );
      }),
    );
  }
}
