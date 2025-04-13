import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_butterfly.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_cloudy.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_coral.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_default.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_dj.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_green_town.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_lu.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_maple.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_marshes.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_neko_king.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_pagan_tower.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_skyline.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_sophia.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_stardust.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_summer_pond.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_sunset.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_twins.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_unreal.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_xin_hua.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_yusitia.dart';
import 'package:cw2bit/modules/c_module_app_theme/provider/flutterflow_theme.dart';

class ThemeCriteria {
  final String name;
  final FlutterFlowTheme light;
  final FlutterFlowTheme dark;

  ThemeCriteria({required this.name, required this.light, required this.dark});

  /// 预设主题列表
  static final _presetThemes = <int, ThemeCriteria>{
    0: ThemeCriteria(name: 'Default', light: LightModeTheme(), dark: DarkModeTheme()),
    1: ThemeCriteria(name: 'Sophia', light: LightSophiaTheme(), dark: DarkSophiaTheme()),
    2: ThemeCriteria(name: 'Sunset', light: LightSunsetTheme(), dark: DarkSunsetTheme()),
    3: ThemeCriteria(name: 'Coral', light: LightCoralTheme(), dark: DarkCoralTheme()),
    4: ThemeCriteria(name: 'Skyline', light: LightSkylineTheme(), dark: DarkSkylineTheme()),
    5: ThemeCriteria(name: 'Green Town', light: LightGreenTownTheme(), dark: DarkGreenTownTheme()),
    6: ThemeCriteria(name: 'Xin Hua', light: LightXinHuaTheme(), dark: DarkXinHuaTheme()),
    7: ThemeCriteria(name: 'Summer Pond', light: LightSummerPondTheme(), dark: DarkSummerPondTheme()),
    8: ThemeCriteria(name: 'Unreal', light: LightUnrealTheme(), dark: DarkUnrealTheme()),
    9: ThemeCriteria(name: 'Butterfly', light: LightButterflyTheme(), dark: DarkButterflyTheme()),
    10: ThemeCriteria(name: 'Maple', light: LightMapleTheme(), dark: DarkMapleTheme()),
    11: ThemeCriteria(name: 'Marshes', light: LightMarshesTheme(), dark: DarkMarshesTheme()),
    12: ThemeCriteria(name: 'Stardust', light: LightStardustTheme(), dark: DarkStardustTheme()),
    13: ThemeCriteria(name: 'Cloudy', light: LightCloudyTheme(), dark: DarkCloudyTheme()),
    14: ThemeCriteria(name: 'Twins', light: LightTwinsTheme(), dark: DarkTwinsTheme()),
    15: ThemeCriteria(name: 'Yusitia', light: LightYusitiaTheme(), dark: DarkYusitiaTheme()),
    16: ThemeCriteria(name: 'Lu', light: LightLuTheme(), dark: DarkLuTheme()),
    17: ThemeCriteria(name: 'Pagan Tower', light: LightPaganTowerTheme(), dark: LightPaganTowerTheme()),
    18: ThemeCriteria(name: 'DJ', light: LightDJTheme(), dark: DarkDJTheme()),
    19: ThemeCriteria(name: 'Neko King 1', light: LightNekoKing1Theme(), dark: DarkNekoKing1Theme()),
  };

  /// 获取预设主题
  static ThemeCriteria getPresetTheme(int index) {
    if (_presetThemes.containsKey(index)) {
      return _presetThemes[index]!;
    } else {
      throw ArgumentError('Invalid theme index: $index');
    }
  }

  /// 获取预设主题列表
  static Map<int, ThemeCriteria> get presetThemes => _presetThemes;
}
