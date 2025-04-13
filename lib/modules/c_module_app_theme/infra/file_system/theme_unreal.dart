import 'package:cw2bit/modules/c_module_app_theme/infra/file_system/theme_default.dart';
import 'package:flutter/material.dart';

class LightUnrealTheme extends LightModeTheme {
  late Color primary = const Color(0xFFa44e41); // vibrant color
  late Color secondary = const Color(0xFFf1d794); // light vibrant color
  late Color tertiary = const Color(0xFF667668); // muted color
}

class DarkUnrealTheme extends DarkModeTheme {
  late Color primary = const Color(0xFF81362c); // vibrant color
  late Color secondary = const Color(0xFF667668); // light muted color
  late Color tertiary = const Color(0xFF243d3d); // dark muted color
}
