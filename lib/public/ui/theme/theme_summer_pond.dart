import 'package:cw2bit/public/ui/theme/theme_default.dart';
import 'package:flutter/material.dart';

class LightSummerPondTheme extends LightModeTheme {
  late Color primary = const Color(0xFF149082); // vibrant color
  late Color secondary = const Color(0xFFf49654); // light vibrant color
  late Color tertiary = const Color(0xFF48944c); // muted color
}

class DarkSummerPondTheme extends DarkModeTheme {
  late Color primary = const Color(0xFF06615a); // vibrant color
  late Color secondary = const Color(0xFF48944c); // light muted color
  late Color tertiary = const Color(0xFFdfe3de); // dark muted color
}
