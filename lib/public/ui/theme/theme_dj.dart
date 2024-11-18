import 'package:cw2bit/public/ui/theme/theme_default.dart';
import 'package:flutter/material.dart';

class LightDJTheme extends LightModeTheme {
  late Color primary = const Color(0xFF29afeb); // vibrant color
  late Color secondary = const Color(0xFFa77cdf); // light vibrant color
  late Color tertiary = const Color(0xFF9165ab); // muted color
}

class DarkDJTheme extends DarkModeTheme {
  late Color primary = const Color(0xFF29afeb); // vibrant color
  late Color secondary = const Color(0xFFc1aed6); // light muted color
  late Color tertiary = const Color(0xFF242d84); // dark muted color
}
