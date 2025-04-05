import 'package:get/get.dart';

import 'state.dart';

class HomepageLogic extends GetxController {
  final HomepageState state = HomepageState();

  var mSelectedBottomBarIndex = 1.obs;

  int get selectedBottomBarIndex => mSelectedBottomBarIndex.value;

  void selectBottomBar(int index) {
    mSelectedBottomBarIndex.value = index;
  }
}
