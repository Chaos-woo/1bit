import 'package:cw2bit/modules/c_module_theme/theme/theme_default.dart';
import 'package:flutter/material.dart';

class LightLuTheme extends LightModeTheme {
  late Color primary = const Color(0xFFb85c57); // vibrant color
  late Color secondary = const Color(0xFFbe7676); // light vibrant color
  late Color tertiary = const Color(0xFF9c8e96); // muted color
}

class DarkLuTheme extends DarkModeTheme {
  late Color primary = const Color(0xFFbe7676); // vibrant color
  late Color secondary = const Color(0xFFeae4e4); // light muted color
  late Color tertiary = const Color(0xFF583232); // dark muted color
}
