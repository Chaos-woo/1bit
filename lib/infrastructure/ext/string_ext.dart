import 'dart:ui';

extension StringColorExt on String {
  Color get toColor {
    String colorString = '${this.padLeft(8, 'F')}';
    return Color(int.parse(colorString, radix: 16));
  }
}
