import 'package:get/get.dart';

import 'state.dart';

class HomepageLogic extends GetxController {
  final HomepageState state = HomepageState();

  var selected_index = 1.obs;

  void changeIndex(int index) {
    selected_index.value = index;
  }
}
