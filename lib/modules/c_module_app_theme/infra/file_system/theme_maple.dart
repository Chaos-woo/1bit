import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_default.dart';
import 'package:flutter/material.dart';

class LightMapleTheme extends LightModeTheme {
  late Color primary = const Color(0xFFa24944); // vibrant color
  late Color secondary = const Color(0xFF9ba7b7); // light vibrant color
  late Color tertiary = const Color(0xFF6f7b86); // muted color
}

class DarkMapleTheme extends DarkModeTheme {
  late Color primary = const Color(0xFF912a26); // vibrant color
  late Color secondary = const Color(0xff9ba7b7); // light muted color
  late Color tertiary = const Color(0xFF151a24); // dark muted color
}
