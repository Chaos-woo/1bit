import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get isReleaseMode => INKs.isReleaseMode;
}
