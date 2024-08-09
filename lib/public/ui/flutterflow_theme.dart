import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kThemeModeKey = '__theme_mode__';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? DarkModeTheme() : LightModeTheme();
  }

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color primaryBtnText;
  late Color lineColor;

  TextStyle get displayLarge => typography.displayLarge;

  TextStyle get displayMedium => typography.displayMedium;

  TextStyle get displaySmall => typography.displaySmall;

  TextStyle get headlineLarge => typography.headlineLarge;

  TextStyle get headlineMedium => typography.headlineMedium;

  TextStyle get headlineSmall => typography.headlineSmall;

  TextStyle get titleLarge => typography.titleLarge;

  TextStyle get titleMedium => typography.titleMedium;

  TextStyle get titleSmall => typography.titleSmall;

  TextStyle get labelLarge => typography.labelLarge;

  TextStyle get labelMedium => typography.labelMedium;

  TextStyle get labelSmall => typography.labelSmall;

  TextStyle get bodyLarge => typography.bodyLarge;

  TextStyle get bodyMedium => typography.bodyMedium;

  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;

  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;

  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF4B39EF);
  late Color secondary = const Color(0xFF39D2C0);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFE0E3E7);
  late Color primaryText = const Color(0xFF14181B);
  late Color secondaryText = const Color(0xFF57636C);
  late Color primaryBackground = const Color(0xFFF1F4F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0x4C4B39EF);
  late Color accent2 = const Color(0x4D39D2C0);
  late Color accent3 = const Color(0x4DEE8B60);
  late Color accent4 = const Color(0xCCFFFFFF);
  late Color success = const Color(0xFF249689);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFFFF5963);
  late Color info = const Color(0xFFFFFFFF);

  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFFE0E3E7);
}

abstract class Typography {
  TextStyle get displayLarge;

  TextStyle get displayMedium;

  TextStyle get displaySmall;

  TextStyle get headlineLarge;

  TextStyle get headlineMedium;

  TextStyle get headlineSmall;

  TextStyle get titleLarge;

  TextStyle get titleMedium;

  TextStyle get titleSmall;

  TextStyle get labelLarge;

  TextStyle get labelMedium;

  TextStyle get labelSmall;

  TextStyle get bodyLarge;

  TextStyle get bodyMedium;

  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  TextStyle get displayLarge => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 64.0,
      );

  TextStyle get displayMedium => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 44.0,
      );

  TextStyle get displaySmall => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );

  TextStyle get headlineLarge => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );

  TextStyle get headlineMedium => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );

  TextStyle get headlineSmall => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
      );

  TextStyle get titleLarge => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );

  TextStyle get titleMedium => TextStyle(
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );

  TextStyle get titleSmall => TextStyle(
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );

  TextStyle get labelLarge => TextStyle(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );

  TextStyle get labelMedium => TextStyle(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );

  TextStyle get labelSmall => TextStyle(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );

  TextStyle get bodyLarge => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );

  TextStyle get bodyMedium => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );

  TextStyle get bodySmall => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;

  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;

  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF4B39EF);
  late Color secondary = const Color(0xFF39D2C0);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFF262D34);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF95A1AC);
  late Color primaryBackground = const Color(0xFF1D2428);
  late Color secondaryBackground = const Color(0xFF14181B);
  late Color accent1 = const Color(0x4C4B39EF);
  late Color accent2 = const Color(0x4D39D2C0);
  late Color accent3 = const Color(0x4DEE8B60);
  late Color accent4 = const Color(0xB2262D34);
  late Color success = const Color(0xFF249689);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFFFF5963);
  late Color info = const Color(0xFFFFFFFF);

  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFF22282F);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
