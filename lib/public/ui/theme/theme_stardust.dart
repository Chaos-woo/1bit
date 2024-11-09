import 'package:cw2bit/public/ui/theme/theme_default.dart';
import 'package:flutter/material.dart';

class LightStardustTheme extends LightModeTheme {
  late Color primary = const Color(0xFFf2cb3f); // vibrant color
  late Color secondary = const Color(0xFF18283c); // light vibrant color
  late Color tertiary = const Color(0xFFacad5d); // muted color
}

class DarkStardustTheme extends DarkModeTheme {
  late Color primary = const Color(0xFFacad5d); // vibrant color
  late Color secondary = const Color(0xFFddded7); // light muted color
  late Color tertiary = const Color(0xFF131926); // dark muted color
}
