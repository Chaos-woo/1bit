import 'package:cw2bit/infra/a_ddd/entity.dart';
import 'package:flutter/material.dart';

class ThemeSelection extends Entity {
  final int index;
  final String name;
  final bool isSelected;

  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color primaryDarkColor;
  final Color secondaryDarkColor;
  final Color tertiaryDarkColor;

  ThemeSelection({
    required this.index,
    required this.name,
    required this.isSelected,
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.primaryDarkColor,
    required this.secondaryDarkColor,
    required this.tertiaryDarkColor,
  });
}
