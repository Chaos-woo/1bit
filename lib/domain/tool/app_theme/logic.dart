import 'package:cw2bit/public/ui/theme/themes.dart';
import 'package:get/get.dart';

class AppThemeLogic extends GetxController {
  final k_theme_list_view_id = '__k_theme_list_view_id__';

  Future<void> change_theme(int theme_index) async {
    await ThemesMgr.singl.set_theme(theme_index);
    Get.appUpdate();
    update([k_theme_list_view_id]);
  }
}
