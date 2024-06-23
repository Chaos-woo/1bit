import 'package:get/get.dart';

import 'state.dart';

class HomepageLogic extends GetxController {
  final HomepageState state = HomepageState();

  var selectedIndex = 1.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
