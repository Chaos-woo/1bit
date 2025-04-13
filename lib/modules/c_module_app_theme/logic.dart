import 'package:cw2bit/infra/a_extension/function_stream_extension.dart';
import 'package:cw2bit/modules/c_module_app_theme/domain/aggregate/theme_aggregate.dart';
import 'package:cw2bit/modules/c_module_app_theme/domain/model/entity/theme_selection.dart';
import 'package:cw2bit/modules/c_module_app_theme/state.dart';
import 'package:get/get.dart';

class AppThemeLogic extends GetxController {
  final AppThemeState state = AppThemeState();

  final kGetxThemeScrollView = '__kGetxThemeScrollView__';

  List<List<ThemeSelection>> getThemeSelections(double screenWidth) {
    var selections = ThemeAggr.getx.getThemeSelections();

    // 主题卡片固定宽度160，根据传入的屏幕宽度决定需要按照多少列排列
    var numCols = (screenWidth / 160).floor();
    return selections.split(numCols);
  }

  Future<void> selectTheme(ThemeSelection selection) async {
    await ThemeAggr.getx.setTheme(selection);

    update([kGetxThemeScrollView]);
  }
}
