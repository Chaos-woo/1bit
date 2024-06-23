import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class WallabagHomepagePage extends StatelessWidget {
  const WallabagHomepagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(WallabagHomepageLogic());
    final state = Get.find<WallabagHomepageLogic>().state;

    return Container();
  }
}
