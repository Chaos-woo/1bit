import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class AppReadingThresholdConfigPage extends StatelessWidget {
  const AppReadingThresholdConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppReadingThresholdConfigLogic logic = Get.put(AppReadingThresholdConfigLogic());
    final AppReadingThresholdConfigState state = Get.find<AppReadingThresholdConfigLogic>().state;

    return Container();
  }
}
