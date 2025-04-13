import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:cw2bit/modules/c_module_app_theme/domain/model/entity/theme_criteria.dart';
import 'package:cw2bit/modules/c_module_app_theme/domain/model/entity/theme_selection.dart';
import 'package:cw2bit/modules/c_module_app_theme/domain/model/event/theme_changed_event.dart';
import 'package:cw2bit/modules/c_module_app_theme/domain/repository/theme_repository.dart';
import 'package:cw2bit/modules/c_module_app_theme/provider/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 主题管理器
class ThemeAggr extends GetxService {
  static const String getxTag = '__getx_theme_aggregate__';

  static ThemeAggr get getx => Get.find(tag: getxTag);

  final ThemeRepository _userThemeRepository;

  ThemeAggr({
    required ThemeRepository userThemeRepository,
  }) : _userThemeRepository = userThemeRepository;

  FlutterFlowTheme getTheme(BuildContext context) {
    int themeIndex = _userThemeRepository.getThemeIndex(defaultThemeIndex: 0);
    var theme = ThemeCriteria.getPresetTheme(themeIndex);
    return Theme.of(context).brightness == Brightness.dark ? theme.dark : theme.light;
  }

  Future<void> setTheme(ThemeSelection selection) async {
    int selectedIndex = selection.index;
    await _userThemeRepository.setThemeIndex(selectedIndex);

    INKs.events.publish(ThemeChangedEvent(
      selectedIndex,
      isDarkMode,
      ThemeCriteria.getPresetTheme(selectedIndex).name,
    ));
  }

  bool get isDarkMode => Theme.of(Get.context!).brightness == Brightness.dark;

  List<ThemeSelection> getThemeSelections() {
    int themeIndex = _userThemeRepository.getThemeIndex(defaultThemeIndex: 0);
    return ThemeCriteria.presetThemes.entries.map((entry) {
      var index = entry.key;
      var theme = entry.value;
      return ThemeSelection(
        index: index,
        name: theme.name,
        isSelected: themeIndex == index,
        primaryColor: theme.light.primary,
        secondaryColor: theme.light.secondary,
        tertiaryColor: theme.light.tertiary,
        primaryDarkColor: theme.dark.primary,
        secondaryDarkColor: theme.dark.secondary,
        tertiaryDarkColor: theme.dark.tertiary,
      );
    }).toList();
  }
}
