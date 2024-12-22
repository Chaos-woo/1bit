import 'package:cw2bit/public/ui/impl/ui_appbar.dart';
import 'package:cw2bit/public/ui/impl/ui_button.dart';
import 'package:cw2bit/public/ui/impl/ui_dialog.dart';
import 'package:cw2bit/public/ui/impl/ui_snackbar.dart';
import 'package:cw2bit/public/ui/impl/ui_sticker.dart';
import 'package:cw2bit/public/ui/impl/ui_text.dart';
import 'package:flutter/material.dart';

/// Ui0处理器
class ui0_ {
  ui0_._();

  static final UiText text = UiText();
  static final UiSnackbar snackbar = UiSnackbar();
  static final UiDialog dialog = UiDialog();
  static final UiAppBar appbar = UiAppBar();
  static final UiSticker sticker = UiSticker();
  static final UiButton button = UiButton();

  static final _ui_icons icons = _ui_icons();
}

final class _ui_icons {
  final sort = Icons.sort_by_alpha_rounded;
  final filter = Icons.filter_alt_rounded;
  final circle_ok = Icons.check_circle_outline_rounded;
  final add = Icons.add_rounded;
  final delete = Icons.delete_outline_rounded;
  final three_lines = Icons.density_medium_rounded;
  final setting = Icons.settings_rounded;
  final arrow_back = Icons.arrow_back_rounded;
  final info = Icons.info_outline_rounded;
  final calendar = Icons.calendar_month_rounded;
}
