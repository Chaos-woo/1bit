import 'package:cw2bit/public/ui/theme/theme_default.dart';
import 'package:flutter/material.dart';

class LightSunsetTheme extends LightModeTheme {
  late Color primary = const Color(0xFF2A4C70); // vibrant color
  late Color secondary = const Color(0xFFAD8B88); // light vibrant color
  late Color tertiary = const Color(0xFF54616F); // muted color
}

class DarkSunsetTheme extends DarkModeTheme {
  late Color primary = const Color(0xFF2A4C70); // vibrant color
  late Color secondary = const Color(0xFF1A3255); // light muted color
  late Color tertiary = const Color(0xFF262232); // dark muted color
}
