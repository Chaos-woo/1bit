import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:cw2bit/modules/c_module_theme/flutterflow_theme.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_butterfly.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_cloudy.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_coral.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_default.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_dj.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_green_town.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_lu.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_maple.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_marshes.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_neko_king.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_pagan_tower.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_skyline.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_sophia.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_stardust.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_summer_pond.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_sunset.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_twins.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_unreal.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_xin_hua.dart';
import 'package:cw2bit/modules/c_module_theme/theme/theme_yusitia.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 主题管理器
class ThemesMgr extends GetxService {
  static const String _getxTag = '__getx_themes_mgr__';

  static ThemesMgr get getx => Get.find(tag: _getxTag);

  final kPfsThemeIndex = '__k_pfs_theme_index__';

  final mThemes = <int, MyAppTheme>{
    0: MyAppTheme(name: 'Default', light: LightModeTheme(), dark: DarkModeTheme()),
    1: MyAppTheme(name: 'Sophia', light: LightSophiaTheme(), dark: DarkSophiaTheme()),
    2: MyAppTheme(name: 'Sunset', light: LightSunsetTheme(), dark: DarkSunsetTheme()),
    3: MyAppTheme(name: 'Coral', light: LightCoralTheme(), dark: DarkCoralTheme()),
    4: MyAppTheme(name: 'Skyline', light: LightSkylineTheme(), dark: DarkSkylineTheme()),
    5: MyAppTheme(name: 'Green Town', light: LightGreenTownTheme(), dark: DarkGreenTownTheme()),
    6: MyAppTheme(name: 'Xin Hua', light: LightXinHuaTheme(), dark: DarkXinHuaTheme()),
    7: MyAppTheme(name: 'Summer Pond', light: LightSummerPondTheme(), dark: DarkSummerPondTheme()),
    8: MyAppTheme(name: 'Unreal', light: LightUnrealTheme(), dark: DarkUnrealTheme()),
    9: MyAppTheme(name: 'Butterfly', light: LightButterflyTheme(), dark: DarkButterflyTheme()),
    10: MyAppTheme(name: 'Maple', light: LightMapleTheme(), dark: DarkMapleTheme()),
    11: MyAppTheme(name: 'Marshes', light: LightMarshesTheme(), dark: DarkMarshesTheme()),
    12: MyAppTheme(name: 'Stardust', light: LightStardustTheme(), dark: DarkStardustTheme()),
    13: MyAppTheme(name: 'Cloudy', light: LightCloudyTheme(), dark: DarkCloudyTheme()),
    14: MyAppTheme(name: 'Twins', light: LightTwinsTheme(), dark: DarkTwinsTheme()),
    15: MyAppTheme(name: 'Yusitia', light: LightYusitiaTheme(), dark: DarkYusitiaTheme()),
    16: MyAppTheme(name: 'Lu', light: LightLuTheme(), dark: DarkLuTheme()),
    17: MyAppTheme(name: 'Pagan Tower', light: LightPaganTowerTheme(), dark: LightPaganTowerTheme()),
    18: MyAppTheme(name: 'DJ', light: LightDJTheme(), dark: DarkDJTheme()),
    19: MyAppTheme(name: 'Neko King 1', light: LightNekoKing1Theme(), dark: DarkNekoKing1Theme()),
  };

  FlutterFlowTheme getTheme(BuildContext context) {
    int themeIndex = INKs.sdk.preferences.getInt(kPfsThemeIndex, defaultValue: 0)!;
    var theme = mThemes[themeIndex]!;
    return Theme.of(context).brightness == Brightness.dark ? theme.dark : theme.light;
  }

  int getThemeIndex() {
    return INKs.sdk.preferences.getInt(kPfsThemeIndex, defaultValue: 0)!;
  }

  Future<void> setThemeIndex(int index) async {
    await INKs.sdk.preferences.putInt(kPfsThemeIndex, index);
  }

  bool get isDarkMode => Theme.of(Get.context!).brightness == Brightness.dark;
}

class MyAppTheme {
  final String name;
  final FlutterFlowTheme light;
  final FlutterFlowTheme dark;

  MyAppTheme({required this.name, required this.light, required this.dark});
}
