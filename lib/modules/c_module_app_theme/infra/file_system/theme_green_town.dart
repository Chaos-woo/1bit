import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_default.dart';
import 'package:flutter/material.dart';

class LightGreenTownTheme extends LightModeTheme {
  late Color primary = const Color(0xFFc6ce7a); // vibrant color
  late Color secondary = const Color(0xFF93a567); // light vibrant color
  late Color tertiary = const Color(0xFF45573d); // muted color
}

class DarkGreenTownTheme extends DarkModeTheme {
  late Color primary = const Color(0xFFc6ce7a); // vibrant color
  late Color secondary = const Color(0xffc2dde1); // light muted color
  late Color tertiary = const Color(0xFF45573d); // dark muted color
}
