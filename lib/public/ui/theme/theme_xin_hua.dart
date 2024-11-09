import 'package:cw2bit/public/ui/theme/theme_default.dart';
import 'package:flutter/material.dart';

class LightXinHuaTheme extends LightModeTheme {
  late Color primary = const Color(0xFF3e4184); // vibrant color
  late Color secondary = const Color(0xFFeebd56); // light vibrant color
  late Color tertiary = const Color(0xFF537ea7); // muted color
}

class DarkXinHuaTheme extends DarkModeTheme {
  late Color primary = const Color(0xFF25234d); // vibrant color
  late Color secondary = const Color(0xffb4c0d7); // light muted color
  late Color tertiary = const Color(0xFF6e4056); // dark muted color
}
