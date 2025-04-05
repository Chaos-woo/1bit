import 'package:cw2bit/modules/c_module_theme/theme/theme_default.dart';
import 'package:flutter/material.dart';

class LightSophiaTheme extends LightModeTheme {
  late Color primary = const Color(0xFF7EAEC3); // vibrant color
  late Color secondary = const Color(0xFF687FA1); // light vibrant color
  late Color tertiary = const Color(0xFFEE8B60); // muted color
}

class DarkSophiaTheme extends DarkModeTheme {
  late Color primary = const Color(0xFF7EAEC3); // vibrant color
  late Color secondary = const Color(0xFF687FA1); // light muted color
  late Color tertiary = const Color(0xFFEE8B60); // dark muted color
}
