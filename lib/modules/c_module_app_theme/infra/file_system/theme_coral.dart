import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_default.dart';
import 'package:flutter/material.dart';

class LightCoralTheme extends LightModeTheme {
  late Color primary = const Color(0xFFCE252D); // vibrant color
  late Color secondary = const Color(0xFFF8DB77); // light vibrant color
  late Color tertiary = const Color(0xFF5BA5B5); // muted color
}

class DarkCoralTheme extends DarkModeTheme {
  late Color primary = const Color(0xFF391B1E); // vibrant color
  late Color secondary = const Color(0xFF92CDAF); // light muted color
  late Color tertiary = const Color(0xFF544D3A); // dark muted color
}
