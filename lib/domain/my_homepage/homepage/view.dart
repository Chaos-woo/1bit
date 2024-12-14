import 'package:cw2bit/domain/my_homepage/explore_homepage/view.dart';
import 'package:cw2bit/domain/my_homepage/text_homepage/view.dart';
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
    {'icon': Icons.category_outlined, 'label': 'Explore'},
    {'icon': Icons.connect_without_contact_rounded, 'label': 'Connect'},
    {'icon': Icons.videogame_asset_rounded, 'label': 'Games'},
    {'icon': Icons.ondemand_video_rounded, 'label': 'Live'},
    {'icon': Icons.book_outlined, 'label': 'Tags'},
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
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          // padding: const EdgeInsets.all(12),
          backgroundColor: Colors.white,
          snakeViewColor: FlutterFlowTheme.of(context).primary.withOpacity(0.9),
          selectedItemColor: null,
          unselectedItemColor: Colors.blueGrey,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: logic.selected_index,
          onTap: (index) => logic.update_page_index(index),
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
