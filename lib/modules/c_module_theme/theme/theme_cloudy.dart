import 'package:cw2bit/modules/c_module_theme/theme/theme_default.dart';
import 'package:flutter/material.dart';

class LightCloudyTheme extends LightModeTheme {
  late Color primary = const Color(0xFF3d6c97); // vibrant color
  late Color secondary = const Color(0xFFb7cbdd); // light vibrant color
  late Color tertiary = const Color(0xFF6189ab); // muted color
}

class DarkCloudyTheme extends DarkModeTheme {
  late Color primary = const Color(0xFF2e567a); // vibrant color
  late Color secondary = const Color(0xFF6189ab); // light muted color
  late Color tertiary = const Color(0xFF131926); // dark muted color
}
