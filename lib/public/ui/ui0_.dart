import 'package:cw2bit/public/ui/impl/ui_appbar.dart';
import 'package:cw2bit/public/ui/impl/ui_dialog.dart';
import 'package:cw2bit/public/ui/impl/ui_snackbar.dart';
import 'package:cw2bit/public/ui/impl/ui_text.dart';
import 'package:flutter/material.dart';

class ui0_ {
  ui0_._();

  static final UiText text = UiText();
  static final UiSnackbar snackbar = UiSnackbar();
  static final UIDialog dialog = UIDialog();
  static final UiAppBar appbar = UiAppBar();

  static final _ui_icons icons = _ui_icons();
}

final class _ui_icons {
  final sort = Icons.sort_by_alpha_rounded;
  final circle_ok = Icons.check_circle_outline_rounded;
  final add = Icons.add_rounded;
  final delete = Icons.delete_outline_rounded;
  final three_lines = Icons.density_medium_rounded;
  final settings = Icons.settings_rounded;
  final arrow_back = Icons.arrow_back_rounded;
}
