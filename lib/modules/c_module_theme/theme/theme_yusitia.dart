import 'package:cw2bit/modules/c_module_theme/theme/theme_default.dart';
import 'package:flutter/material.dart';

class LightYusitiaTheme extends LightModeTheme {
  late Color primary = const Color(0xFF73acd7); // vibrant color
  late Color secondary = const Color(0xFFc8d5df); // light vibrant color
  late Color tertiary = const Color(0xFF7295b2); // muted color
}

class DarkYusitiaTheme extends DarkModeTheme {
  late Color primary = const Color(0xFF73acd7); // vibrant color
  late Color secondary = const Color(0xFF7295b2); // light muted color
  late Color tertiary = const Color(0xFF2b3346); // dark muted color
}
