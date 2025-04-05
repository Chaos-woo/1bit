import 'package:cw2bit/modules/c_module_theme/theme/theme_default.dart';
import 'package:flutter/material.dart';

class LightTwinsTheme extends LightModeTheme {
  late Color primary = const Color(0xFFcd7773); // vibrant color
  late Color secondary = const Color(0xFFeacb79); // light vibrant color
  late Color tertiary = const Color(0xFF8f6485); // muted color
}

class DarkTwinsTheme extends DarkModeTheme {
  late Color primary = const Color(0xFFac8977); // vibrant color
  late Color secondary = const Color(0xFF8f6485); // light muted color
  late Color tertiary = const Color(0xFF35243a); // dark muted color
}
