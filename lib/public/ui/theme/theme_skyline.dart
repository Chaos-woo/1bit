import 'package:cw2bit/public/ui/theme/theme_default.dart';
import 'package:flutter/material.dart';

class LightSkylineTheme extends LightModeTheme {
  late Color primary = const Color(0xFFc0a671); // vibrant color
  late Color secondary = const Color(0xFFf4d080); // light vibrant color
  late Color tertiary = const Color(0xFF5c595f); // muted color
}

class DarkSkylineTheme extends DarkModeTheme {
  late Color primary = const Color(0xFF1a1c4b); // vibrant color
  late Color secondary = const Color(0xFFb6756d); // light muted color
  late Color tertiary = const Color(0xFF2d3553); // dark muted color
}
