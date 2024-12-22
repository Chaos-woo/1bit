import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ToolQuickAccessComponent extends StatelessWidget {
  ToolQuickAccessComponent({Key? key}) : super(key: key);

  final logic = Get.find<ToolQuickAccessLogic>();
  final state = Get.find<ToolQuickAccessLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
