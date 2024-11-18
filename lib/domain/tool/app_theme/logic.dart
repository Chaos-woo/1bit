import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:get/get.dart';

class AppThemeLogic extends GetxController {
  final k_theme_list_view_id = '__k_theme_list_view_id__';

  Future<void> change_theme(int theme_index) async {
    await c0_.mgr_theme.set_theme(theme_index);

    /// 调用getx框架更新整体APP
    Get.appUpdate();

    /// 更新当前页面的主题选择器
    update([k_theme_list_view_id]);
  }
}
