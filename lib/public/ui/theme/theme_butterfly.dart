import 'package:cw2bit/public/ui/theme/theme_default.dart';
import 'package:flutter/material.dart';

class LightButterflyTheme extends LightModeTheme {
  late Color primary = const Color(0xFFa33c5e); // vibrant color
  late Color secondary = const Color(0xFFf03561); // light vibrant color
  late Color tertiary = const Color(0xFF66648b); // muted color
}

class DarkButterflyTheme extends DarkModeTheme {
  late Color primary = const Color(0xFF842640); // vibrant color
  late Color secondary = const Color(0xFFa59fca); // light muted color
  late Color tertiary = const Color(0xFF14141f); // dark muted color
}
