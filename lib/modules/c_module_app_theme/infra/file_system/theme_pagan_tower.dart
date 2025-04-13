import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_default.dart';
import 'package:flutter/material.dart';

class LightPaganTowerTheme extends LightModeTheme {
  late Color primary = const Color(0xFF2f55ac); // vibrant color
  late Color secondary = const Color(0xFF6da2d0); // light vibrant color
  late Color tertiary = const Color(0xFF47457a); // muted color
}

class DarkPaganTowerTheme extends DarkModeTheme {
  late Color primary = const Color(0xFF222249); // vibrant color
  late Color secondary = const Color(0xFFc2a6b2); // light muted color
  late Color tertiary = const Color(0xFF5f435f); // dark muted color
}
