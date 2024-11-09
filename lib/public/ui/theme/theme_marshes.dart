import 'package:cw2bit/public/ui/theme/theme_default.dart';
import 'package:flutter/material.dart';

class LightMarshesTheme extends LightModeTheme {
  late Color primary = const Color(0xFFe2b84a); // vibrant color
  late Color secondary = const Color(0xFFbbbcab); // light vibrant color
  late Color tertiary = const Color(0xFF737257); // muted color
}

class DarkMarshesTheme extends DarkModeTheme {
  late Color primary = const Color(0xFFe2b84a); // vibrant color
  late Color secondary = const Color(0xFFbbbcab); // light muted color
  late Color tertiary = const Color(0xFF232212); // dark muted color
}
