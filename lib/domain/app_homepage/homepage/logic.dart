import 'package:get/get.dart';

import 'state.dart';

class HomepageLogic extends GetxController {
  final HomepageState state = HomepageState();

  var m_selected_index = 1.obs;

  int get selected_index => m_selected_index.value;

  void update_page_index(int index) {
    m_selected_index.value = index;
  }
}
